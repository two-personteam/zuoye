package com.itshidu.jeelite.app.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.itshidu.jeelite.app.entity.system.User;

/*
 * 学分
 * 学历层次、毕业院校、毕业时间
 * 招生老师、
 * QQ、微信
 * */

@Entity
@Table(name="edo_student")
@PrimaryKeyJoinColumn(name="student_id")
public class Student extends User{
	//入学时间、家长电话、学历层次、毕业院校、专业、毕业时间、头像、学分、推荐人、
	private int score;			//综合积分
	private Date ruxueTime;		//入学时间
	private String jiazhang;	//家长信息
	private String xueli;		//学历层次
	private String biyeSchool;	//毕业院校
	private Date biyeTime;		//学历毕业时间
	private String zhuanye;		//学历的专业
	private String avatar;		//头像
	private String tuijian;		//推荐人信息
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getRuxueTime() {
		return ruxueTime;
	}
	public void setRuxueTime(Date ruxueTime) {
		this.ruxueTime = ruxueTime;
	}
	public String getJiazhang() {
		return jiazhang;
	}
	public void setJiazhang(String jiazhang) {
		this.jiazhang = jiazhang;
	}
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getBiyeSchool() {
		return biyeSchool;
	}
	public void setBiyeSchool(String biyeSchool) {
		this.biyeSchool = biyeSchool;
	}
	public Date getBiyeTime() {
		return biyeTime;
	}
	public void setBiyeTime(Date biyeTime) {
		this.biyeTime = biyeTime;
	}
	public String getZhuanye() {
		return zhuanye;
	}
	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getTuijian() {
		return tuijian;
	}
	public void setTuijian(String tuijian) {
		this.tuijian = tuijian;
	}
	
}

