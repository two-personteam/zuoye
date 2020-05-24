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
@Table(name="edo_sys_permission")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Permission extends UUIDEntity{
	private String name;	//名称
	private String code;	//标记
	
	@ManyToMany(fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	@JoinTable(name="edo_sys_role_permission",joinColumns= {@JoinColumn(name="perm_id")},inverseJoinColumns= {@JoinColumn(name="role_id")})
	private List<Role> roles = new ArrayList<Role>();
	
	public String getName() {
		return name;
	}
	public String getCode() {
		return code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
}
