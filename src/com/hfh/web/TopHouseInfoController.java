package com.hfh.web;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.service.HouseManager;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller ;
@Controller
public class TopHouseInfoController {

    @Autowired
    private HouseManager houseManager;

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
}