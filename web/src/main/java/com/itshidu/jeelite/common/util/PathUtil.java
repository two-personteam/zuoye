package com.itshidu.jeelite.common.util;

import java.io.File;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class PathUtil {
	/**
	 * 获取ClassPath的绝对路径（相当于src）
	 * @return
	 */
	public static String getClassPath(){
		URL url = PathUtil.class.getClassLoader().getResource("");
		return URLDecoder.decode(url.toString()).substring(6);
	}
	/**
	 * 获取ClassPath的File对象（相当于src）
	 * @return
	 */
	public static File getClassPathFile(){
		return new File(getClassPath());
	}
	
}
