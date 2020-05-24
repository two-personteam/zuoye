package com.itshidu.jeelite.app.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itshidu.holyweb.persistence.BaseDAO;
import com.itshidu.jeelite.app.dao.UserDao;
import com.itshidu.jeelite.app.entity.system.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired BaseDAO dao;

	@Override
	public User findByUsername(String username) throws Exception {
		return dao.findOne("from User u where u.username=?", username);
	}

	@Override
	public User findByEmail(String email) throws Exception {
		return dao.findOne("from User u where u.email=?", email);
	}

	@Override
	public User findByPhone(String phone) throws Exception {
		return dao.findOne("from User u where u.phone=?", phone);
	}

	@Override
	public User findUserByNameOrEmailOrPhone(String account) throws Exception {
		return dao.findOne("from User u where (u.username=? or u.email=? or u.phone=?)",account,account,account);
	}
	
	
}
