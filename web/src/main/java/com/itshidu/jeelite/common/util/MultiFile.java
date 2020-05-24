package com.itshidu.jeelite.common.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 当读取上传表单的各部分时会用到该encoding，如果没有指定 encoding *
 * 则使用系统缺省的encoding。建议在这里设置成utf-8，并把jsp 的charset也设置成utf-8，否则可能会出现乱码。
 */
@SuppressWarnings("unchecked")
public class MultiFile {
	private HttpServletRequest request = null;
	private long sizeMax = 1024 * 1024 * 1024 * 2; // 上传文件的大小限制;
	private String encoding = "UTF-8"; // 字符编码，当读取上传表单的各部分时会用到该encoding
	private int sizeThreshold = DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD;

	public MultiFile(HttpServletRequest request) {
		this.request = request;

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(sizeThreshold);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(sizeMax);
		upload.setHeaderEncoding(encoding);
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println(isMultipart);
		
		try {
			Map<String, List<FileItem>> map = upload.parseParameterMap(request);
			for(Entry<String, List<FileItem>> en : map.entrySet()){
				System.out.println(en.getKey());
				System.out.println(en.getValue());
			}
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				// 其他参数
				String type = item.getContentType();
				if (type == null) {
					// System.out.println(item.getString(item.getFieldName()));
					continue;
				}

				System.out.println("666");
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void haha() {
		// 需要返回的fileName
		String fileName = null;

		// Check that we have a file upload request
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.request.getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				// 其他参数
				String type = item.getContentType();
				if (type == null) {
					// System.out.println(item.getString(item.getFieldName()));
					continue;
				}

				// 文件参数
				fileName = item.getName();
				System.out.println(fileName);
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}