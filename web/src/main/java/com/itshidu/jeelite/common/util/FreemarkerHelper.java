package com.itshidu.jeelite.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * Freemarker工具类
 * @author Administrator
 *
 */
@Component
public class FreemarkerHelper {
	//private static final String CHARSET = "UTF-8";
	private static Configuration cfg = null;
	/*static{
		cfg = new Configuration();
		cfg.setDefaultEncoding(CHARSET);
		try {
			URL url = FreemarkerHelper.class.getClassLoader().getResource("");
			String classpath = URLDecoder.decode(url.toString()).substring(6);
			cfg.setDirectoryForTemplateLoading(new File(classpath, "ftl"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	@Autowired
	private void init(FreeMarkerConfigurer fc) {
		cfg=fc.getConfiguration();
	}
	/**
	 * 加工模板，输出到控制台(测试用)
	 */
	public static void processToConsole(String ftlName,Map<String, Object> data) throws Exception{
		OutputStreamWriter osw = new OutputStreamWriter(System.out);
		Template tmp = getTemplate(ftlName);
		tmp.process(data, osw);
		org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer cc=new org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer();
		cc.getConfiguration();
	}
	/**
	 * 加工模板，输出到文件
	 */
	public static void processToFile(String ftlName,Map<String, Object> data,String fileAbsPath) throws Exception{
		File file = new File(fileAbsPath);
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
		}
		FileOutputStream fos = new FileOutputStream(file);
		process(ftlName, data, fos);
	}
	/**
	 * 加工模板，输出到文件
	 */
	public static void processToFile(String ftlName,Map<String, Object> data,File outFile) throws Exception{
		FileOutputStream fos = new FileOutputStream(outFile);
		process(ftlName, data, fos);
	}
	/**
	 * 加工模板，输出到OutputStream
	 */
	public static void process(String ftlName,Map<String, Object> data,OutputStream out) throws Exception{
		OutputStreamWriter osw = new OutputStreamWriter(out);
		Template tmp = getTemplate(ftlName);
		tmp.process(data, osw);
		osw.close();
	}
	/**
	 * 加工模板，输出到OutputStreamWriter
	 */
	public static void process(String ftlName,Map<String, Object> data,Writer writer) throws Exception{
		Template tmp = getTemplate(ftlName);
		tmp.process(data, writer);
		writer.close();
	}
	/**
	 * 加工模板，返回字符串
	 * @param ftlName
	 * @param data
	 * @return
	 */
	public static String processToString(String ftlName,Map<String, Object> data) throws Exception{
		StringWriter sw = new StringWriter();
		Template tmp = getTemplate(ftlName);
		tmp.process(data, sw);
		return sw.toString();
	}
	
	public static Template getTemplate(String ftlName) throws Exception{
		return cfg.getTemplate(ftlName);
	}
	
}
