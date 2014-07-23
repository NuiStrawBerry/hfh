package com.hfh.dao;

import java.util.List;

import com.hfh.bean.EmailedHouse;

public interface EmailHouseInfoDao {
	
	void saveEmialedHouseInfo( final EmailedHouse eh);
	List<EmailedHouse> getEmailedList();
	void getEmailedById(String id);
	void delteEmialedById(String id);
}
