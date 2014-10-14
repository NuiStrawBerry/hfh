package com.hfh.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.EmailedHouse;
import com.hfh.management.emailagent.EmailHouseInfoService;
import com.hfh.management.houseinfo.service.HouseManager;

@Controller
public class EmailHouseController {
	
	@Autowired
    private EmailHouseInfoService ehiService;
	
	@RequestMapping(value="/emailToUs",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> searchR(@RequestParam("fullname") String fullname,
			@RequestParam("email") String email,
			@RequestParam("mobile") String phone,
			@RequestParam("message") String message,
			@RequestParam("hid") String hid
			){
		Map<String,String> result = new HashMap<String,String>();
		System.out.println("fullname=========="+fullname);
		System.out.println("email=========="+email);
		System.out.println("mobile=========="+phone);
		System.out.println("message=========="+message);
		System.out.println("hid=========="+hid);
		EmailedHouse eh = new EmailedHouse();
		eh.setEmail(email);
		eh.setFullname(fullname);
		eh.setHouseId(hid);
		eh.setMessage(message);
		eh.setPhone(phone);
		ehiService.saveEmialedHouseInfo(eh);
		//model.addAttribute("", arg1);
		result.put("result", "success");
		result.put("resCode", "0");
		return result;
	}

}
