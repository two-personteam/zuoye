package com.itshidu.jeelite.common.filter;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 静态资源映射,需要在web.xml中配置mapping、location两项属性
 * 
 * location：真实资源目录 (  例：/static/js,/app/*,/WEB-INF/resource/*  )
 *		--	第一个/代表WebRoot，多个目录用英文逗号分隔,*代表全部后代目录
 * mapping：虚拟资源目录， ( 例：/res )
 * 		--  只能设置一个值，可以映射到所有location目录
 * 		--  会向request中存入属性，例如mapping值为res时，页面中可以直接使用${res}代表location中的所有目录
 * 
 * 此过滤器会向request中存入几个属性，我们可以通过getAttribute获取，也可以使用el表达式获取：
 * 		-- ${path}			上下文目录，代表WebRoot ( 例如：${path}/js/app.js )
 * 		-- ${basePath}		上下文目录，代表WebRoot，完整路径，结尾自带/  ( 例如：${basePath}js/app.js )
 * 		-- ${res}			虚拟资源目录 ( 例如：${res}/jquery.js )
 * 
 * @author 夏增明
 * @date 2011-03-25
 * 
 */
public class ResourceMappingFilter implements Filter {
	
	private List<String> dirs=new ArrayList<String>();//资源文件夹
	private String mapping;
	private ServletContext application;
	private String debug="true";
	
	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		request.setAttribute("path", path);
		request.setAttribute("basePath", basePath);
		request.setAttribute("res", path+mapping);
		
		
		String uri = request.getRequestURI();
		
		if(uri.indexOf(request.getContextPath()+mapping)!=0){
			chain.doFilter(arg0, arg1);
			return;
		}

		int start = uri.lastIndexOf(mapping)+mapping.length();
		int end = uri.length();
		String name = uri.substring(start, end);

		for(String patt : dirs){
			String resPath = patt+name;
			String realPath = application.getRealPath(resPath);
			if(new File(realPath).exists()){
				RequestDispatcher disp = request.getRequestDispatcher(resPath);
				disp.forward(arg0, arg1);
				return;
			}
		}
		chain.doFilter(arg0, arg1);
	}

	
	public void init(FilterConfig config) throws ServletException {
		String[] arr = config.getInitParameter("location").split(",");
		this.mapping = config.getInitParameter("mapping");
		this.debug = config.getInitParameter("debug");
		
		application = config.getServletContext();
		
		for(String str : arr){
			if(str.endsWith("/*")){
				String res = str.substring(0, str.length()-2);
				String real = application.getRealPath(res);
				File file = new File(real);
				readDirectory(res,file, file);
			}else if(str.endsWith("/")){
				dirs.add(str.substring(0, str.length()-1));
			}else{
				dirs.add(str);
			}
		}
		
		for(String dr : dirs){
			log("ResourceMapping: "+mapping+" --> "+ dr);
		}
	}
	
	private void readDirectory(String dir,File src,File file){
		
		if(file.isDirectory()){
			String res = dir+file.getAbsolutePath().substring(src.getAbsolutePath().length());
			
			dirs.add(res);
			for(File fo : file.listFiles()){
				readDirectory(dir,src,fo);
			}
		}
		
	}
	
	private void log(String info){
		if(debug.equals("true")){
			System.out.println(info);
		}
	}
	
}
