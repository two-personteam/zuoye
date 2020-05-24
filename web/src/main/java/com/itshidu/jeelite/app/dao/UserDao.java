package com.itshidu.jeelite.app.dao;

import com.itshidu.jeelite.app.entity.system.User;

public interface UserDao {

	User findByUsername(String username) throws Exception;

	User findByEmail(String email) throws Exception;

	User findByPhone(String phone) throws Exception;

	User findUserByNameOrEmailOrPhone(String account) throws Exception;

}
