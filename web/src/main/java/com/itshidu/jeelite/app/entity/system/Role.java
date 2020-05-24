package com.itshidu.jeelite.app.entity.system;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.itshidu.holyweb.entity.UUIDEntity;

@Entity
@Table(name="edo_sys_role")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Role extends UUIDEntity{
	private String name;	//角色名称
	private String code;	//角色标记
	
	@ManyToMany(fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	@JoinTable(name="edo_sys_user_role",joinColumns= {@JoinColumn(name="role_id")},inverseJoinColumns= {@JoinColumn(name="user_id")})
	private List<User> users = new ArrayList<User>();
	
	@ManyToMany(fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	@JoinTable(name="edo_sys_role_permission",joinColumns= {@JoinColumn(name="role_id")},inverseJoinColumns= {@JoinColumn(name="perm_id")})
	private List<Permission> perms = new ArrayList<Permission>();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Permission> getPerms() {
		return perms;
	}
	public void setPerms(List<Permission> perms) {
		this.perms = perms;
	}
	
}
