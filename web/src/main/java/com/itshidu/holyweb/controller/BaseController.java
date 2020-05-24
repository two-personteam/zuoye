package com.itshidu.holyweb.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itshidu.holyweb.service.CommonService;
import com.itshidu.jeelite.common.others.jsonlib.JsonDateValueProcessor;
import com.itshidu.jeelite.common.util.DigestHelper;
import com.itshidu.jeelite.common.util.MD5Util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class BaseController {
	@Autowired protected HttpServletRequest request;
	@Autowired protected HttpSession session;
	@Autowired protected ServletContext application;
	
	@Autowired protected CommonService service;
	
	protected ObjectMapper mapper = new ObjectMapper();
	
	protected String basepath() {
		String path = this.request.getContextPath();
		return this.request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	protected String md5(String text) {
		return MD5Util.md5(text);
	}
	
	
	
	/* -------- 输出json和文本 --------- */
	protected String json(Object obj,JsonConfig cfg) throws IOException{
		String text = null;
		if(cfg==null)cfg = new JsonConfig();
		cfg.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		//cfg.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		if(obj.getClass().isArray()||obj instanceof Collection){
			text = JSONArray.fromObject(obj,cfg).toString();
		}else{
			text = JSONObject.fromObject(obj,cfg).toString();
		}
		return text;
	}
	protected String json(Object obj) throws IOException{
		return json(obj, new JsonConfig());
	}
	protected String printJson(Object obj,String[] excludeFields) throws IOException{
		JsonConfig cfg = new JsonConfig();
		cfg.setExcludes(excludeFields);
		return json(obj, cfg);
	}

	/*protected String result(int code,String msg){
		com.alibaba.fastjson.JSONObject jo = new com.alibaba.fastjson.JSONObject();
		jo.put("code",code);
		jo.put("msg", msg);
		return jo.toJSONString();
	}*/
	protected String result(Object... objects){
		com.alibaba.fastjson.JSONObject jo = new com.alibaba.fastjson.JSONObject();
		for(int i=0;i<objects.length-1;i++){
			jo.put(objects[i++].toString(),objects[i]);
		}
		return jo.toJSONString();
	}
}
