package com.hfh.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.HouseInfo;
import com.hfh.management.activies.Activies;
import com.hfh.management.activies.ActiviesService;
import com.hfh.management.houseinfo.service.HouseManager;
@Controller
public class TopHouseInfoController {

    @Autowired
    private HouseManager houseManager;
    
    @Autowired
	ActiviesService activiesService;
    

    @RequestMapping(value="/tophouseInfos",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List<HouseInfo>> getTop8HousinfoList(@RequestParam("type") String type,@RequestParam("pageSize") int pageSize,
			@RequestParam("limit") int limit){
        Map<String,List<HouseInfo>> r = new HashMap<String,List<HouseInfo>>();
        List<HouseInfo> result = houseManager.getTopHouseInfoList(type,pageSize,limit);
        r.put("houseInfoList",result);
        return r;
    }

    
    @RequestMapping(value="/topflowInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List<HouseInfo>> topflowInfo(){
        Map<String,List<HouseInfo>> r = new HashMap<String,List<HouseInfo>>();
        List<HouseInfo> result = houseManager.topflowInfo();
        r.put("houseInfoList",result);
        return r;
    }
    
    @RequestMapping(value="/homehoth",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List<HouseInfo>> popularHouseList(){
        Map<String,List<HouseInfo>> r = new HashMap<String,List<HouseInfo>>();
        List<HouseInfo> result = houseManager.popularHouse();
        r.put("houseInfoList",result);
        return r;
    }
    
    @RequestMapping(value="/activies",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List<Activies>> getActivity(){
    	 Map<String,List<Activies>> r = new HashMap<String,List<Activies>>();
    	 List<Activies> result = activiesService.gethomeAc();;
         r.put("acInfoList",result);
         return r;
    	
    }
    
    @RequestMapping(value="/cooperater",method = RequestMethod.POST)
    @ResponseBody
    public void getCooperater(){
    
    }
}