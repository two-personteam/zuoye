package com.itshidu.jeelite.app.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itshidu.holyweb.persistence.BaseDAO;
import com.itshidu.jeelite.app.dao.UserDao;
import com.itshidu.jeelite.app.entity.system.User;
import com.itshidu.jeelite.app.service.UserService;
import com.itshidu.jeelite.common.util.DigestHelper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired BaseDAO dao;
	@Autowired UserDao userDao;
	@Override
	public String register(String username, String password, String email, String phone) throws Exception {
		//判断账号、邮箱、电话、是否可用
		if(userDao.findByUsername(username)!=null) {
			return "UsernameExists";
		}
		if(userDao.findByEmail(email)!=null) {
			return "EmailExists";
		}
		if(userDao.findByPhone(phone)!=null) {
			return "PhoneExists";
		}
		
		User user  = new User();
		user.setUsername(username);
		user.setCreateTime(new Date());
		user.setEmail(email);
		user.setPhone(phone);
		user.setSalt(UUID.randomUUID().toString());
		user.setState(0);
		user.setPassword(md5(sha1(password)+sha1(user.getSalt())));
		dao.save(user);
		return "success";

	}
	
	
	private String md5(String text) {
		try {
			return DigestHelper.digest(text, DigestHelper.MD5);
		} catch (IOException e) { }
		return null;
	}
	private String sha1(String text) {
		try {
			return DigestHelper.digest(text, DigestHelper.SHA1);
		} catch (IOException e) { }
		return null;
	}


	@Override
	public String login(String account, String password) throws Exception {
		User user = userDao.findUserByNameOrEmailOrPhone(account);
		if(user==null) {
			return ("AccountNull");
		}
		String mi = md5(sha1(password)+sha1(user.getSalt())); 
		if(!mi.equals(user.getPassword())) {
			return ("PwdErr");
		}
		return "Success";
	}
}
