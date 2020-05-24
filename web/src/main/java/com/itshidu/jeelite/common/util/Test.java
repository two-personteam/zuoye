package com.itshidu.jeelite.common.util;

import org.apache.log4j.Logger;

public class Test {
	
	private static Logger logger = Logger.getLogger(Test.class);

	public static void main(String[] args) {
		//log4j会自动到src下寻找log4j.properties

		logger.debug("这是调试信息，没什么大用");
		logger.info("这是普通信息");
		logger.warn("这是警告信息");
		logger.error("这是错误信息");
		logger.fatal("此为严重错误");
		
	}

}
