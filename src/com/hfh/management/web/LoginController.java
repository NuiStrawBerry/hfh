package com.hfh.management.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hfh.bean.User;
import com.hfh.service.UserManager;

@Controller
@RequestMapping("/management")
public class LoginController {
	
	@Autowired
	private UserManager userManager;
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(){
		String result = "redirect:management/index";
		//if(!"admin".equals("")){
			result = "management/login";
		//}
		return result;
	}
	
	@RequestMapping(value = "loginAction", method = RequestMethod.POST)
	public String loginAction(@RequestParam("userName") String userName,
			@RequestParam("password") String password,HttpServletRequest request){
		String result = "redirect:index";
		boolean r = userManager.checkUser(userName, password);
		if(!r){
			result = "management/login";
		}else{
			User user = new User();
			user.setUserId(userName);
			user.setPassword(password);
			HttpSession session = request.getSession();
			session.setAttribute("currentUser",  userName);
		}
		return result;
	}
	
	@RequestMapping(value = "logout")
	public String logoutAction(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		session.invalidate();
		return  "redirect:login";
	}
	
}
