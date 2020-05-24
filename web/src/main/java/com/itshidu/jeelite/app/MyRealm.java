package com.itshidu.jeelite.app;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.itshidu.holyweb.persistence.HibernateHelper;
import com.itshidu.holyweb.persistence.Paging;
import com.itshidu.holyweb.service.CommonService;
import com.itshidu.jeelite.app.entity.system.Permission;
import com.itshidu.jeelite.app.entity.system.Role;
import com.itshidu.jeelite.app.entity.system.User;
import com.itshidu.jeelite.common.util.MD5Util;


/**
 * 自定义的指定Shiro验证用户登录与授权的类
 * 用户登录处理，用户登录之后加载角色和权限
 * @author 夏增明
 */
public class MyRealm extends AuthorizingRealm {
	private static Logger logger = Logger.getLogger(MyRealm.class);
	
	@Autowired CommonService service;
	@Autowired SessionFactory factory;
	
	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法(non-Javadoc)
	 * 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
	 * @see 个人感觉若使用了Spring3.1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
	 * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
		String username = (String) super.getAvailablePrincipal(principals);

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		org.hibernate.Session session = null;
		try {
			session = factory.openSession();
			session.getTransaction().begin();
			String hql="select r from Role r left join r.users u where u.username=?";
			Paging<Role> paging = HibernateHelper.find(session, hql, 1, 999,username);
			for(Role r:paging.getList()) {
				System.out.println("角色："+r.getName());
				info.addRole(r.getCode());
				for(Permission p:r.getPerms()) {
					System.out.println("---"+p.getName());
					info.addStringPermission(p.getCode());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session.isOpen())session.close();
		}
		
		// 若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址
		// 详见applicationContext.xml中的<bean id="shiroFilter">的配置
		return info;
	}

	/**
	 * 登录信息和用户验证信息验证,subject.login()之后执行这里
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// 获取基于用户名和密码的令牌
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		// 两个token的引用都是一样的,本例中是org.apache.shiro.authc.UsernamePasswordToken@33799a1e
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

		String username = token.getUsername();
		String password = new String(token.getPassword());
		logger.info("LoginInfo:" + username + "," + password);

		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(username, password, this.getName());
		
		try {
			User user = service.findOne("from User where username=?", username);
			
			//如果用户不存在
			if(user==null){
				throw new UnknownAccountException();
			}
			System.out.println(password);
			System.out.println(user.getPassword());
			System.out.println(user.getSalt());
			//如果密码不正确
			if(!user.getPassword().equals(MD5Util.md5(MD5Util.md5(password)+user.getSalt()))){
				throw new IncorrectCredentialsException();
			}
			switch(user.getState()){
			case 0:throw new LockedAccountException("未激活的账号："+username);
			case 2:throw new DisabledAccountException("禁用的账号："+username);
			case 1:
				logger.info("登录成功:" + username);
				this.setSession("user", user); //向shiro中存入用户信息
				break;
			}
			
			
		} catch (AuthenticationException e) {
			throw e;
		}catch (Exception e) {
			e.printStackTrace();
		}
		// 没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
		return authcInfo;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			org.apache.shiro.session.Session session = currentUser.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}