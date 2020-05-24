package com.itshidu.jeelite.app.entity;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.itshidu.jeelite.app.entity.system.User;

/*
 * 
 * */

@Entity
@Table(name="edo_teacher")
@PrimaryKeyJoinColumn(name="teacher_id")
public class Teacher extends User{
	
}
