package com.hfh.bean;

import java.io.Serializable;
import java.util.List;


public class HouseInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5066262505088840319L;
	private float area;		//面积
    private int bedroom;	//卧室数量
    private String code;	//代码

    private String destription;	//描述

	private int floorSize;	//楼层

	private String id;

    private List<FileMeta> images; //图片

    private int leaseStatus;	//出租状态
	private int leaseTrem;	//租期
	private String location;	//位置

    private float  rental;	//最小价格
	private String title;
	private String type;	//类型
	private String imagesName;
	
	private String isHot;
	
	private String isTopShow;
	
	private String createTime;
	
	
	
	public String getIsHot() {
		return isHot;
	}
	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}
	public String getIsTopShow() {
		return isTopShow;
	}
	public void setIsTopShow(String isTopShow) {
		this.isTopShow = isTopShow;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getImagesName() {
		return imagesName;
	}
	public void setImagesName(String imagesName) {
		this.imagesName = imagesName;
	}
	public float getArea() {
		return area;
	}
	public int getBedroom() {
		return bedroom;
	}
	public String getCode() {
		return code;
	}
	public String getDestription() {
		return destription;
	}
	
	public int getFloorSize() {
		return floorSize;
	}

    public String getId() {
		return id;
	}

	public List<FileMeta> getImages() {
		return images;
	}
	public int getLeaseStatus() {
		return leaseStatus;
	}
	public int getLeaseTrem() {
		return leaseTrem;
	}
	public String getLocation() {
		return location;
	}
	public float getRental() {
	        return rental;
	    }
	public String getTitle() {
        return title;
    }
	public String getType() {
		return type;
	}
	public void setArea(float area) {
		this.area = area;
	}
	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setDestription(String destription) {
		this.destription = destription;
	}
	public void setFloorSize(int floorSize) {
		this.floorSize = floorSize;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setImages(List<FileMeta> images) {
		this.images = images;
	}
	public void setLeaseStatus(int leaseStatus) {
		this.leaseStatus = leaseStatus;
	}
	public void setLeaseTrem(int leaseTrem) {
		this.leaseTrem = leaseTrem;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setRental(float rental) {
	    this.rental = rental;
	}
	public void setTitle(String title) {
        this.title = title;
    }
	public void setType(String type) {
		this.type = type;
	}
}
