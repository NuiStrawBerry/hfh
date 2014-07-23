package com.hfh.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.HouseInfo;
import com.hfh.common.SendMail;
import com.hfh.management.houseinfo.service.HouseManager;

@Controller
public class HouseInfoDetail {
	  @Autowired
	    private HouseManager houseManager;
	  
	  @RequestMapping(value="/houseInfoDetailPage",method = RequestMethod.GET)
	    public String getHouseInfoDetailPage(@RequestParam("id") String id, Model model){
	        HouseInfo houseInfo = houseManager.getHouseInfo(id);
	        model.addAttribute(houseInfo);//("houseInfo",result);
	        System.out.println("===send mail===");
	       
	        return "houseDetail";
	    }
	  
	  
	    @RequestMapping(value="/fhouseinfodetail",method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String,HouseInfo> getHouseInfoDetail(@RequestParam("id") String id ){
	        Map<String,HouseInfo> r = new HashMap<String,HouseInfo>();
	        HouseInfo result = houseManager.getHouseInfo(id);
	        r.put("houseInfo",result);
	        return r;
	    }

}


