package com.hfh.management.houseinfo.dao;

import com.hfh.bean.HouseInfo;

import java.util.List;

public interface HouseInfoDao {
	void addHouseInfo(HouseInfo houseInfo);
    List<HouseInfo> getHouseInfoList();
    List<HouseInfo> getTopHouseInfoList();
    List<HouseInfo> getTopHouseInfoList(String type,int pageSize,int limit) ;
	void deleteHouseInfoById(String id);
    HouseInfo getHouseInfoById(String id);
	void deleteHouseInfos();
	void updateHouseInfo(HouseInfo hi);
	boolean isExit(String id );
	boolean changeStatus(String rId,String p,String value);
	List<HouseInfo> getHouseInfoByConditions(String keyWords, String type,
			String location, String bedrooms, String minRetal, String maxRetal,
			String minFloorSize, String maxFloorSize);
	
	List<HouseInfo> topflowInfo();
	public List<HouseInfo> popularHouse();
	
}
