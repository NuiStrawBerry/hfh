package com.hfh.management.activies;

public class Activies {


	private String id;
	private String activieTime;
	private String content;
	private String creater;
	private String createTime;
	private String title;
	
	public Activies(){}
	public String getActivieTime() {
		return activieTime;
	}
	public String getContent() {
		return content;
	}
	public String getCreater() {
		return creater;
	}
	public String getCreateTime() {
		return createTime;
	}
	public String getTitle() {
		return title;
	}
	public void setActivieTime(String activieTime) {
		this.activieTime = activieTime;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
