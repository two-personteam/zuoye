package com.itshidu.jeelite.app.entity.system;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.itshidu.holyweb.entity.UUIDEntity;

@Entity
@Table(name="edo_sys_menu")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Menu extends UUIDEntity {
	
	private String text;		//标题文字
	private String href;		//链接地址
	private String icon;		//图标class
	private String color; 		//图标颜色
	private int sort;			//排序，从小到大
	
	@ManyToOne(fetch=FetchType.LAZY)
	@Cascade(CascadeType.SAVE_UPDATE)
	@JoinColumn(name="parent_id")
	private Menu parent;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="parent")
	@Cascade(CascadeType.SAVE_UPDATE)
	@OrderBy("sort")
	private List<Menu> children=new ArrayList<Menu>();
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public Menu getParent() {
		return parent;
	}
	public void setParent(Menu parent) {
		this.parent = parent;
	}
	public List<Menu> getChildren() {
		return children;
	}
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	
}
