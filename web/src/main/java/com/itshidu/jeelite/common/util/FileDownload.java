package com.itshidu.jeelite.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 下载文件 创建人：Master.Xia 创建时间：2014年06月08日
 * 
 * @version
 */
public class FileDownload {

	/**
	 * @param request
	 * @param response
	 * @param fileAbsPath 文件绝对路径(包括文件名和扩展名)
	 * @param showName 下载后看到的文件名
	 * @return 文件名
	 */
	public static void execute(HttpServletRequest request,HttpServletResponse response, InputStream input,long length, String showName)throws Exception {
		String info = request.getHeader("User-Agent").toLowerCase();
		if (info.contains("firefox")) { // Firefox
			showName = new String(showName.getBytes(), "ISO-8859-1");
		} else { // IE,Chrome
			showName = URLEncoder.encode(showName, "UTF-8");
		}
		response.reset(); // 响应重置
		response.setHeader("Content-Disposition", "attachment; filename=\""+ showName + "\"");
		response.addHeader("Content-Length", ""+length);
		response.setContentType("application/octet-stream;charset=UTF-8");
		OutputStream out = response.getOutputStream();
		int len = 0;
		byte[] buffer = new byte[1024*8];
		while ((len = input.read(buffer)) != -1) {
			out.write(buffer,0,len);
		}
		input.close();
		response.flushBuffer();
	}
	public static void execute(HttpServletRequest request,
			HttpServletResponse response, File file, String showName)
			throws Exception {
		execute(request, response, new FileInputStream(file), file.length(), showName);
	}
	public static void execute(HttpServletRequest request, HttpServletResponse response, String fileAbsPath, String showName) throws Exception{
		execute(request, response, new File(fileAbsPath), showName);
	}
	/**
	 * 请求转发到一个指定的文件，就像浏览器直接访问这个文件一样，如果遇到浏览器不认识的文件类型，则会下载它，支持断点续传
	 * @param request
	 * @param response
	 * @param file
	 * @throws Exception
	 */
	public static void forward(HttpServletRequest request,HttpServletResponse response,File file)throws Exception {

		Path path = Paths.get(file.getAbsolutePath());

		int length = (int)file.length();
		int start = 0;
		int end = length - 1;

		String range = request.getHeader("Range");
		if(range!=null&&range.length()>0) {
			range = range.toLowerCase();	//RANGE:BYTES=100-500
			range = range.replaceAll("\\s*", ""); //去除字符串中所有的不可见字符
			if(range.contains("bytes=")) {//bytes=100
				if(range.contains("-")) {
					String a = range.substring(6, range.indexOf("-"));
					start = Integer.parseInt(a);
					if(range.charAt(range.length()-1)!='-') {
						String b = range.substring(range.indexOf("-")+1);
						end = Integer.parseInt(b);
					}
				}else {
					String a = range.substring(6);
					start = Integer.parseInt(a);
				}
			}
		}
		
		int contentLength = end - start + 1;
		response.reset();
		response.setHeader("Accept-Ranges", "bytes");
		response.setContentType(Files.probeContentType(path));
		response.setHeader("Content-Range",String.format("bytes %s-%s/%s", start, end, length));
		response.setHeader("Content-Length", String.format("%s", contentLength));
		
		response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
		
		//如果是下载，则弹框提示，解决乱码问题
		String info = request.getHeader("User-Agent").toLowerCase();
		String showName = file.getName();
		if (info.contains("firefox")) { // Firefox
			showName = new String(showName.getBytes(), "ISO-8859-1");
		} else { // IE,Chrome
			showName = URLEncoder.encode(showName, "UTF-8");
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+ showName + "\"");
		
		//数据传输
		InputStream in = null;
		try{
			in = new FileInputStream(file);
			int len,remain = contentLength;
			byte[] buffer = new byte[1024*8];
			OutputStream out = response.getOutputStream();
			int plan = start;
			while(plan>0){
				plan -= in.skip(plan);
			}
			while((len=in.read(buffer))!=-1 && remain > 0) {
				out.write(buffer, 0, (remain<len? remain:len)  );
			}
		}catch (Exception e) { 
			throw e;
		}finally {
			try {in.close(); } catch (Exception e2) { }
			
		}
		/*
		try {
			int len, remain = contentLength;
			ByteBuffer buffer = ByteBuffer.allocate(1024 * 8);
			SeekableByteChannel input = Files.newByteChannel(path);
			OutputStream output = response.getOutputStream();
			input.position(start);
			while ( (len = input.read(buffer))!=-1 && remain>0 ) {
				buffer.clear();
				output.write(buffer.array(), 0, (remain<len? remain:len) );
				remain -= len;
			}
		} catch (Exception e) { }
		*/
	}
}
