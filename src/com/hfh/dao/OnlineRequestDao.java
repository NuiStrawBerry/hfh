package com.hfh.dao;

import java.util.List;

import com.hfh.bean.OlineRequestBean;

public interface OnlineRequestDao {
	
	void saveOrInfo(OlineRequestBean ori);
	
	List<OlineRequestBean> getOrInfoList();
	
	/*OrInfo getOrInfoById(String id);*/

}
