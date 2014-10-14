package com.hfh.management.emailagent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfh.bean.EmailedHouse;
import com.hfh.common.SendMail;

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
	
	@Override
	public List<EmailedHouse> getEmailedHouseList() {
		List<EmailedHouse> result = ehiDao.getEmailedHouseList();
		return result;
	}

	@Override
	public EmailedHouse getEmailedHouseById(String id) {
		EmailedHouse result = ehiDao.getEmailedHouseById(id);
		return result;
	}

}
