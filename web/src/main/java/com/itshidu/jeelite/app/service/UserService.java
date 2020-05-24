package com.itshidu.jeelite.app.service;

public interface UserService {
	/**
	 * 注册（用户名，明文密码，邮箱，手机号）
	 * @param username
	 * @param password
	 * @param email
	 * @param phone
	 */
	String register(String username, String password, String email, String phone)throws Exception;

	String login(String account, String password)throws Exception;

}
