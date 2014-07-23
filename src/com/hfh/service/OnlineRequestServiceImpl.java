package com.hfh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfh.bean.OlineRequestBean;
import com.hfh.dao.OnlineRequestDao;

@Service
public class OnlineRequestServiceImpl implements OnlineRequestService {

	@Autowired
	OnlineRequestDao olrd;
	
	@Override
	public void saveInfo(OlineRequestBean ori) {
		olrd.saveOrInfo(ori);
	}

	/*@Override
	public List<OrInfo> getOrInfoList() {
		return null;
	}

	@Override
	public OrInfo getOrInfoById(String id) {
		return null;
	}*/

}
