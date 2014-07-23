package com.hfh.management.houseinfo.web;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.service.HouseManager;

import org.apache.commons.lang.StringUtils;
import org.doomdark.uuid.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/management")
public class AddHouseInfoController {

    @Autowired
    private HouseManager houseManager;

    @RequestMapping(value="/addhouseinfo",method = RequestMethod.POST)
    @ResponseBody
    public String addHouseInfo( @RequestParam("rental") String rental,@RequestParam("type") String type,@RequestParam("bedroom") String bedroom
            ,@RequestParam("location") String location,@RequestParam("area") String area,@RequestParam("title") String title,
                                @RequestParam("leaseTrem") String leaseTrem,@RequestParam("code") String code,
                                @RequestParam("descirption") String descirption){
        String uuid =  UUIDGenerator.getInstance().generateTimeBasedUUID().toString();
        HouseInfo hi = new HouseInfo();
        hi.setLocation(location);
		hi.setId(uuid);
        hi.setTitle(title);
        if( StringUtils.isNotBlank(area))
        	hi.setArea(Float.parseFloat(area));
        if(  StringUtils.isNotBlank(bedroom))
        	hi.setBedroom(Integer.parseInt(bedroom));
        hi.setType(type);
        if( StringUtils.isNotBlank(rental))
        	hi.setRental(Float.parseFloat(rental));
        if(  StringUtils.isNotBlank(leaseTrem))
        	hi.setLeaseTrem(Integer.parseInt(leaseTrem));
        hi.setDestription(descirption);
        hi.setLocation(location);
        hi.setCode(code);
        houseManager.addHouseInfo(hi);
        return "";
    }

    @RequestMapping("/removeHouseInfo")
    public void removeHouseInfo(@RequestParam("hid") String hid){
        houseManager.deleteHouseInfoById(hid);

    }
}
