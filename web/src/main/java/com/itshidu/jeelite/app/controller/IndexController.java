package com.itshidu.jeelite.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itshidu.holyweb.controller.BaseController;
import com.itshidu.jeelite.common.util.FreemarkerHelper;
import com.itshidu.jeelite.common.util.VerifyCode;

/**
 * 通用的功能写在这里，例如验证码
 * @author Master.Xia
 */
@Controller
public class IndexController extends BaseController {
	
	@Autowired RedisTemplate<String, Object> rt ;
	
	
	@RequestMapping("/index.html")
	public String index_html() throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("name", "悟空");
		String str = FreemarkerHelper.processToString("hello.ftl", data);
		System.out.println(str);
		return "index";
	}

	
	//可以使用原生方法输出图片，但SpringMVC推荐下面这种写法
	@RequestMapping("/public/code.jpg")
	@ResponseBody
	public ResponseEntity<byte[]> code2()throws Exception{
		VerifyCode vc = new VerifyCode();
		session.setAttribute("code", vc.getCode());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		headers.add("Pragma", "no-cache");
		headers.add("Cache-Control", "no-cache");
		headers.setDate("Expires", 0);
		return new ResponseEntity<byte[]>(vc.getImageBytes(), headers, HttpStatus.OK);
	}
	
	
}
