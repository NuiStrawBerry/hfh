package com.hfh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfh.bean.EmailedHouse;
import com.hfh.common.SendMail;
import com.hfh.dao.EmailHouseInfoDao;
import com.hfh.service.EmailHouseInfoService;

@Service
public class EmailHouseInfoServiceImpl implements EmailHouseInfoService {

	@Autowired
	private EmailHouseInfoDao ehiDao; 
	
	 @Autowired
	    private SendMail sendMail;

	@Override
	public boolean saveEmialedHouseInfo(EmailedHouse eh) {
		ehiDao.saveEmialedHouseInfo( eh);
		 sendMail.send();
		return false;
	}

}
