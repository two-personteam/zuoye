package com.itshidu.jeelite.app.listener;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;

import com.itshidu.holyweb.service.CommonService;
import com.itshidu.jeelite.common.util.ApplicationContextUtil;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// 应用程序启动的时候这里执行一次
		final ServletContext application = event.getServletContext();
		final CommonService service = ApplicationContextUtil.getContext().getBean(CommonService.class);
		final SessionFactory factory = ApplicationContextUtil.getContext().getBean(SessionFactory.class);
		//加载分类信息到ServletContext中
		
	}
	

}
