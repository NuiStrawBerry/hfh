package com.hfh.service;

import java.util.List;

import com.hfh.bean.OlineRequestBean;

public interface OnlineRequestService {
	
	void saveInfo(OlineRequestBean ori);
	
	List<OlineRequestBean> getOrInfoList();
	
	OlineRequestBean getOrInfoDetail(String id);

}
