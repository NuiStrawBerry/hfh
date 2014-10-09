package com.hfh.bean;

public class News {

	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String title;
	private String creatime;
 	private String content;
 	private String type;
 	private String status="0";
/* 	private enum Type{
 		Real_Estate_News("ren", 1), Weekly_Expats_Events("wee", 2), Hot("hot", 3), ;
 		
 		private String name;
 		private int index;

		private Type(String name,int index){
 			this.name = name;
 			this.index = index;
 			
 		}
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}
 	};*/
 	public News(){}
 	
 	public News(String status){
 		this.status = status;
 	}
 	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreatime() {
		return creatime;
	}
	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
 	
	 
}
