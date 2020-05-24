package com.itshidu.jeelite.common.util;

import java.util.UUID;


public class PasswordUtil {
	
	/**
	 * 用明文密码和salt得到密文密码
	 * @param password
	 * @param salt
	 * @return
	 * @throws Exception
	 */
	public static String encode(String password,String salt) throws Exception {
		String md5 = DigestHelper.digest(password, DigestHelper.MD5);
		return DigestHelper.digest(md5+salt, DigestHelper.SHA1);
	}
	/**
	 * 验证【明文、密文、盐】是否匹配
	 * @param plain
	 * @param salt
	 * @param cipher
	 * @return
	 */
	public static boolean check(String plain,String salt,String cipher) throws Exception {
		return cipher.equals(PasswordUtil.encode(plain, salt));
	}
	
}
