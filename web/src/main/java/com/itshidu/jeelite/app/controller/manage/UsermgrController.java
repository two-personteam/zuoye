package com.itshidu.jeelite.app.controller.manage;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itshidu.holyweb.AjaxResult;
import com.itshidu.holyweb.persistence.Paging;
import com.itshidu.holyweb.service.CommonService;
import com.itshidu.jeelite.app.entity.system.User;

@Controller
public class UsermgrController{
	
	@Autowired CommonService service;

	@RequestMapping("/admin/usermgr/save")
	@ResponseBody
	public AjaxResult save(User user) throws Exception{
		service.save(user);
		return AjaxResult.create().put("text", "success");//返回给浏览器的json数据
	}
	@RequestMapping("/admin/usermgr/update")
	@ResponseBody
	public AjaxResult update(User user) throws Exception{
		service.update(user);
		return AjaxResult.create().put("text", "success");//返回给浏览器的json数据
	}
	@RequestMapping("/admin/usermgr/remove")
	@ResponseBody
	public AjaxResult remove(@RequestParam Serializable id) throws Exception{
		service.delete(User.class,id);
		return AjaxResult.create().put("text", "success");//返回给浏览器的json数据
	}
	@RequestMapping("/admin/usermgr/list")
	@ResponseBody
	public AjaxResult list(
			@RequestParam int page,
			@RequestParam int rows
			) throws Exception{
		Paging<User> paging = service.find("from User", page, rows);
		return AjaxResult.create().put("total", paging.getTotalCount()).put("rows", paging.getList());
	}
	
}
