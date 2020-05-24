package com.itshidu.jeelite.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringHelper {

	/**
	 * java去除字符串中的空格、回车、换行符、制表符
	 * @param Master
	 * @return
	 */
	public static String replaceBlank(String str) {
		String dest = "";
		if (str != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}
	
	public static boolean isEmpty(String s) {
		return s==null||s.length()==0;
	}
	public static boolean isNotEmpty(String s) {
		return s!=null&&s.length()>0;
	}
	
	// 字符串的替换
	public static String replace(String strSource, String strOld, String strNew) {
		if (strSource == null) {
			return null;
		}
		int i = 0;
		if ((i = strSource.indexOf(strOld, i)) >= 0) {
			char[] cSrc = strSource.toCharArray();
			char[] cTo = strNew.toCharArray();
			int len = strOld.length();
			StringBuffer buf = new StringBuffer(cSrc.length);
			buf.append(cSrc, 0, i).append(cTo);
			i += len;
			int j = i;
			while ((i = strSource.indexOf(strOld, i)) > 0) {
				buf.append(cSrc, j, i - j).append(cTo);
				i += len;
				j = i;
			}
			buf.append(cSrc, j, cSrc.length - j);
			return buf.toString();
		}
		return strSource;
	}
}
