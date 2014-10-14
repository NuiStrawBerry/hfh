package com.hfh.management.emailagent;

import java.util.List;

import com.hfh.bean.EmailedHouse;

public interface EmailHouseInfoDao {
	
	void saveEmialedHouseInfo( final EmailedHouse eh);
	
	void delteEmialedById(String id);
	
	public List<EmailedHouse> getEmailedHouseList();
	
	public EmailedHouse getEmailedHouseById(String id);
}
