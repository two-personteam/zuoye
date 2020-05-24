package com.itshidu.jeelite.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.AjaxFilterChain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itshidu.holyweb.AjaxResult;
import com.itshidu.jeelite.app.service.UserService;

@Controller
public class LoginController {

	@Autowired UserService userService;
	
	@ResponseBody
	@RequestMapping("/public/register")
	public Object register(HttpServletRequest request)throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		switch (userService.register(username,password,email,phone)) {
		case "success":return "1";
		case "UsernameExists": return "2";
		case "EmailExists":return "3";
		case "PhoneExists":return "4";
		case "error":return "5";
		default:
			break;
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/public/login")
	public Object login(HttpServletRequest request)throws Exception{
		String account = request.getParameter("account"); //账号（邮箱/手机/用户名）
		String password = request.getParameter("password"); //明文密码

		
		switch (userService.login(account,password)) {
		case "AccountNull":	return AjaxResult.create().put("text", "AccountNull");
		case "PwdErr": 		return AjaxResult.create().put("text", "PwdErr");
		case "Success": 	return AjaxResult.create().put("text", "Success");
		default: break;
		}
		
		return null;
	}
}
