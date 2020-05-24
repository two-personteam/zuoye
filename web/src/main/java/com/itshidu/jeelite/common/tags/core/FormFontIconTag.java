package com.itshidu.jeelite.common.tags.core;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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

import com.itshidu.jeelite.common.util.FreemarkerHelper;
import com.itshidu.jeelite.common.util.PathUtil;


/**
 * 
 * @author Master.Xia
 *
 */
public class FormFontIconTag extends TagSupport {
	private static final long serialVersionUID = -7457805945713981480L;
	private static Logger logger = Logger.getLogger(FormFontIconTag.class);
	
	private String text="字体图标";	//文字
	private int iframeWidth=600;	//小窗口宽度
	private int iframeHeight=400;	//小窗口高度
	private String name="icon";		//表单字段名
	private String value="fa fa-file-text-o"; //表单字段值
	private String onColorChange="";//颜色变化时的回调,内置参数：hsb,hex,rgb,el,bySetColor

	
	public String getOnColorChange() {
		return onColorChange;
	}
	public void setOnColorChange(String onColorChange) {
		this.onColorChange = onColorChange;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setIframeWidth(int iframeWidth) {
		this.iframeWidth = iframeWidth;
	}
	public void setIframeHeight(int iframeHeight) {
		this.iframeHeight = iframeHeight;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int doStartTag() throws JspException {
		return EVAL_PAGE;
	}

	/*------------*/
	private static long lastModified = 0;
	private static Map<String, String> cache = new ConcurrentHashMap<String, String>();
	/*------------*/
	public int doEndTag() throws JspException {
		JspWriter out = null;
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		StringBuffer buffer = new StringBuffer();
		
		try {
			out = this.pageContext.getOut();
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("text", text);
			data.put("path", request.getContextPath());
			data.put("uuid", UUID.randomUUID().toString());
			data.put("iframeWidth",iframeWidth);
			data.put("iframeHeight",iframeHeight);
			data.put("name",name);
			data.put("value",value);
			data.put("onColorChange",onColorChange);
			buffer.append(FreemarkerHelper.processToString("tag/FontIcon.ftl", data));
			
			out.print(buffer.toString());
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
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
