package com.hfh.management.houseinfo.web;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.service.HouseManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yzYang on 14-2-10.
 */
@Controller
@RequestMapping("/management")
public class HouseInfoListController {

    @Autowired
    private HouseManager houseManager;

    @RequestMapping("/getHos")
    @ResponseBody
    public Map<String,Object> getHouseInfos(){
        Map<String,Object> mr = new HashMap<String,Object>();
        List r = houseManager.getHouseInfos();
        mr.put("rows",r);
        mr.put("total",r.size());
        return mr;
    }

    @RequestMapping("/obtainHouseInfo")
    @ResponseBody
    public HouseInfo removeHouseInfo(@RequestParam("hid") String hid){
       // houseManager.deleteHouseInfoById(hid);
        HouseInfo houseInfo = houseManager.getHouseInfo(hid);

        return houseInfo;
    }
}
