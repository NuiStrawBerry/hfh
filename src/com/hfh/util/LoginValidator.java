/**  
 * Class LoginValidator 
 * 
 * @author  lgsun
 * @version $Revision:1.0.0, $Date: 2011-3-17 下午08:37:18$ 
 */
package com.hfh.util;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.hfh.bean.User;

public class LoginValidator implements Validator
{
	private Logger	logger	= Logger.getLogger(getClass().getName());

	
	public boolean supports(Class clazz)
	{
		logger.log(Level.INFO, "supports method("+User.class.getName()+")");
		return clazz.equals(User.class);
	}


	public void validate(Object obj, Errors errors)
	{
		User users = (User) obj;
		logger.log(Level.INFO, "supports validate("+users.getUserName()+","+users.getPassword()+")");
		if(!users.getUserName().trim().equals("lgsun"))
		{
			errors.rejectValue("userName","",null,"The user name is wrong.");
		}
		if(!users.getPassword().trim().equals(users.getPassword()))
		{
			errors.rejectValue("password","",null,"The password is wrong.");
		}
	}

}
