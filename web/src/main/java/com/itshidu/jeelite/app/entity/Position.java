package com.itshidu.jeelite.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 位置，地区
 * @author Master.Xia
 */
@Entity
@Table(name="my_position")
public class Position {
	@Id
	private int id;					//主键ID
	private long code_id;			//地区码
	private long parent_code_id;	//父级地区码
	private String position_name;	//地区名称
	private int level;				//地区等级（0全国，1省，2市，3区，4镇，5街道）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getCode_id() {
		return code_id;
	}
	public void setCode_id(long code_id) {
		this.code_id = code_id;
	}
	public long getParent_code_id() {
		return parent_code_id;
	}
	public void setParent_code_id(long parent_code_id) {
		this.parent_code_id = parent_code_id;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
}
