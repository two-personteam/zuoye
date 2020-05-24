package com.itshidu.jeelite.common.web;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebListener
@WebFilter(urlPatterns="/*")
public class WebContext implements Filter,ServletRequestListener {
	
	private static class RequestAndResponse {
		HttpServletRequest request;
		HttpServletResponse response;
	}
	
	private static ConcurrentHashMap<Thread, RequestAndResponse> cache = new ConcurrentHashMap<Thread, RequestAndResponse>();

	public static HttpServletRequest request() {
		return cache.get(Thread.currentThread()).request;
	}
	public static HttpServletResponse response() {
		return cache.get(Thread.currentThread()).response;
	}
	public static HttpSession session() {
		return request().getSession();
	}
	public static ServletContext application() {
		return session().getServletContext();
	}
	public static String path() {
		return request().getContextPath();
	}
	public static String basepath() {
		HttpServletRequest request = request();
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	}
	
	/* ---- Filter ---- */
	@Override
	public void destroy() { }
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("有人经过....");
		RequestAndResponse rr = WebContext.cache.get(Thread.currentThread());
		rr.request = (HttpServletRequest) arg0;
		rr.response = (HttpServletResponse) arg1;
		
		String basepath=rr.request.getScheme()+"://"+rr.request.getServerName()+":"+rr.request.getServerPort()+rr.request.getContextPath()+"/";
		rr.request.setAttribute("path", rr.request.getContextPath());
		rr.request.setAttribute("basepath", basepath);
		
		chain.doFilter(arg0, arg1);
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException { }
	
	/* ---- Listener ---- */
	@Override
	public void requestDestroyed(ServletRequestEvent event) {
		//System.out.println("有request销毁------");
		WebContext.cache.remove(Thread.currentThread());
	}
	@Override
	public void requestInitialized(ServletRequestEvent event) {
		//System.out.println("有request诞生++++++");
		WebContext.cache.put(Thread.currentThread(), new RequestAndResponse());
	}
	
	
}
