package com.hfh.bean;

import java.io.Serializable;

public class Job implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2989268469018569543L;
	private String content;
	private String creatime;
	private String id;
	private String status;
	private String title;
	
	public Job(){}

	public Job(String id){
		this.id=id;
	}

	public String getContent() {
		return content;
	}

	public String getCreatime() {
		return creatime;
	}

	public String getId() {
		return id;
	}
	
	public String getStatus() {
		return status;
	}
	
	public String getTitle() {
		return title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
