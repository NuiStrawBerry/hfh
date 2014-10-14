package com.hfh.management.emailagent;

import java.util.List;

import com.hfh.bean.EmailedHouse;


public interface EmailHouseInfoService {
	
	boolean saveEmialedHouseInfo(EmailedHouse eh);
	
	public List<EmailedHouse> getEmailedHouseList();
	
	public EmailedHouse getEmailedHouseById(String id);

}
