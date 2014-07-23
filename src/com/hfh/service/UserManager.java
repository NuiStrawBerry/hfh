package com.hfh.service;

import com.hfh.bean.User;

public interface UserManager {
	
	boolean checkUser(String userId, String passwd);
}
