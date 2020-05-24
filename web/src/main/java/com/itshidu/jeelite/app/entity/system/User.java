package com.itshidu.jeelite.app.entity.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.itshidu.holyweb.entity.UUIDEntity;

@Entity
@Table(name="edo_sys_user")
@Inheritance(strategy=InheritanceType.JOINED)
//@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class User extends UUIDEntity {
	@Column(unique=true)
	private String username;	//用户名
	private String password;	//加密之后的密码(md5(sha1(明文密码)+sha1(盐)))
	private String salt;		//密码加盐
	private int state;			//用户状态（0未激活，1已激活，2被屏蔽）
	private String email;		//邮箱
	private String phone;		//手机
	private String qq;			//QQ
	private String weixin;		//微信
	private Date createTime;	//账号创建时间
	//姓名、性别、籍贯、身份证号、身份证家庭住址、出生日期、
	private String name;		//姓名
	private String sex;			//性别
	private String jiguan;		//籍贯
	private String idcode;		//身份证号
	private String idaddr;		//身份证家庭住址
	private Date birthday;		//出生日期
	
	/*@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="edo_sys_user_role",
	joinColumns= {@JoinColumn(name="user_id")},
	inverseJoinColumns= {@JoinColumn(name="role_id")})
	private List<Role> roles = new ArrayList<Role>();*/
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWeixin() {
		return weixin;
	}
	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getJiguan() {
		return jiguan;
	}
	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}
	public String getIdcode() {
		return idcode;
	}
	public void setIdcode(String idcode) {
		this.idcode = idcode;
	}
	public String getIdaddr() {
		return idaddr;
	}
	public void setIdaddr(String idaddr) {
		this.idaddr = idaddr;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	
}
