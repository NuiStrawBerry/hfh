package com.hfh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import com.hfh.service.UserManager;

@Service
public class UserManagerImpl implements UserManager{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public boolean checkUser(String userId,String passwd){
		boolean reslut =  jdbcTemplate.queryForList("SELECT userid FROM t_user where userId=? and passwd=?",
				userId, passwd).size() > 0?true:false;
				
		return reslut;
	};
}
