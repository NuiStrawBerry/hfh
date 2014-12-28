package com.hfh.web;

import com.hfh.bean.EmailedHouse;
import com.hfh.management.emailagent.EmailHouseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class EmailHouseController {
	
	@Autowired
    private EmailHouseInfoService ehiService;
	
	@RequestMapping(value="/emailToUs",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> searchR(@RequestParam("fullname") String fullname,
			@RequestParam("email") String email,
			@RequestParam("tel") String phone,
			@RequestParam("message") String message,
			@RequestParam("hid") String hid,
			@RequestParam("title") String title
			){
		Map<String,String> result = new HashMap<String,String>();
		EmailedHouse eh = new EmailedHouse();
		eh.setEmail(email);
		eh.setFullname(fullname);
		eh.setHouseId(hid);
		eh.setMessage(message);
		eh.setPhone(phone);
		eh.setHouseTitle(title);
		boolean flag =ehiService.saveEmialedHouseInfo(eh);
		if(flag){
			result.put("result", "success");
			result.put("resCode", "1");
		}else{
			result.put("result", "failed");
			result.put("resCode", "0");
		}
		return result;
	}

}
