package com.itshidu.jeelite.common.tags.core;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import com.itshidu.jeelite.common.util.PathUtil;


/**
 * 
 * @author Master.Xia
 *
 */
public class BaseTag extends TagSupport {
	private static final long serialVersionUID = -7128938950421458162L;
	private static Logger logger = Logger.getLogger(BaseTag.class);
	
	protected String names = "default";// 加载类型
	private boolean xmlReload = true; //是否动态读取xml
	private String xmlFileName = "WebAssets.xml"; //相对于src目录

	protected String cssTheme ;
	
	public String getCssTheme() {
		return cssTheme;
	}


	public void setCssTheme(String cssTheme) {
		this.cssTheme = cssTheme;
	}

	public void setNames(String names) {
		this.names = names;
	}


	public int doStartTag() throws JspException {
		return EVAL_PAGE;
	}

	/*------------*/
	private static File configFile=null; //配置文件
	private static long lastModified = 0;
	private static Map<String, String> cache = new ConcurrentHashMap<String, String>();
	/*------------*/
	public int doEndTag() throws JspException {
		System.out.println(names);
		JspWriter out = null;
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		StringBuffer buffer = new StringBuffer();
		String types[] = names.split(",");
		try {
			out = this.pageContext.getOut();
			if(configFile==null) {
				URL url = BaseTag.class.getClassLoader().getResource(xmlFileName);
				configFile = new File(URLDecoder.decode(url.toString()).substring(6));
			}
			System.out.println(configFile);
			assert !configFile.exists();
			//如果配置文件被修改则重新加载 
			if(xmlReload&&configFile.lastModified()!=BaseTag.lastModified){
				logger.info("加载 "+configFile.getName()+" 文件...");
				BaseTag.lastModified = configFile.lastModified();
				cache.clear();
				SAXReader reader = new SAXReader();
				Document doc = reader.read(configFile);
				Element root = doc.getRootElement();
				StringBuilder text = new StringBuilder();
				for(Iterator<Element> it=root.elementIterator();it.hasNext();){
					Element element = it.next();
					String name=element.attribute("name").getValue();
					List<Node> list = element.content();
					for(int i=0;i<list.size();i++){
						Node node = list.get(i);
						//如果是注释节点则不处理
						if(node.getNodeType()==Node.COMMENT_NODE){
							continue;
						}
						if(node instanceof Element){
							Element el = (Element) node;
							boolean ht = (el.getText()!=null);
							
							if("link".equals(el.getName())){
								ht = false;
								Attribute a =el.attribute("href");
								if(a.getText().startsWith("/")){
									a.setText(request.getContextPath()+a.getText());
								}
							}
							if("script".equals(el.getName())){
								Attribute a =el.attribute("src");
								if(a!=null&&a.getText().startsWith("/")){
									a.setText(request.getContextPath()+a.getText());
								}
							}
							
							/*
							//所有标签的src和href属性如果以/开始，都转义为path
							Attribute a =el.attribute("src");
							Attribute b =el.attribute("href");
							Attribute c = a!=null? a:(b!);
							if(a!=null&&a.getText().startsWith("/")){
								a.setText(request.getContextPath()+a.getText());
							}
							*/
							if(ht)el.addText("");
							text.append("\r\n");
						}
						text.append(node.asXML().trim());
					}
					cache.put(name, text.toString());
					text.setLength(0);
				}
			}
			for(int i=0;i<types.length;i++){
				buffer.append(cache.get(types[i].trim()));
			}

			
			out.print(buffer.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}finally{
			if(out!=null){
				try {
					out.clearBuffer();
					buffer.setLength(0);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return EVAL_PAGE;
	}
	
}
