package com.hfh.dao;

import java.util.List;

import com.hfh.bean.OlineRequestBean;

public interface OnlineRequestDao {
	
	public void saveOrInfo(OlineRequestBean ori);
	
	public List<OlineRequestBean> getOrInfoList();

	public OlineRequestBean getOrInfoDetail(String id);
	

}
