package com.hfh.management.emailagent;

import com.hfh.bean.EmailedHouse;
import com.hfh.common.SendMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmailHouseInfoServiceImpl implements EmailHouseInfoService {


	@Autowired
	private EmailHouseInfoDao ehiDao; 
	
	 @Autowired
	    private SendMail sendMail;

	@Override
	public boolean saveEmialedHouseInfo(EmailedHouse eh) {
		//TODO 等待处理 邮件没有成功的重发
		ehiDao.saveEmialedHouseInfo( eh);
		 sendMail.send(eh);
		return true;
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
