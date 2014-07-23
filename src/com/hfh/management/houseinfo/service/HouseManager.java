package com.hfh.management.houseinfo.service;

import com.hfh.bean.HouseInfo;

import java.util.List;

public interface HouseManager {
	void addHouseInfo(HouseInfo houseInfo);
    List<HouseInfo> getHouseInfos();
    List getTopHouseInfos();
    List<HouseInfo> getTopHouseInfoList(String type,int pageSize,int limit) ;
    HouseInfo getHouseInfo(String id);
	void deleteHouseInfoById(String id);
	void deleteHouseInfos();
	void updateHouseInfo();
	void changeLeaseStatus();
	
	List <HouseInfo> getHouseInfoByConditions(String keyWords,String type,String location,String bedrooms,
			String minRetal,String maxRetal,String minFloorSize,String maxFloorSize);
	
	List<HouseInfo> getHouseInfoByType(String type);
	
	List<HouseInfo> topflowInfo();
	
}
