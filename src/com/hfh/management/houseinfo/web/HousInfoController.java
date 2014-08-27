/**
 * 
 */
package com.hfh.management.houseinfo.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.service.HouseManager;

/**
 * @author yzYang
 *
 */

@Controller
@RequestMapping("/management")
public class HousInfoController {
	
	 	@Autowired
	    private HouseManager houseManager;
	    
	    private Logger logger = Logger.getLogger(HousInfoController.class);
	    
	    private final String ADD_CODE="0";
	    
	    /**
	     * 
	     * @description   后台展示 获取数据
	     * @user yzYang
	     * @date 2014年8月16日
	     * @return
	     *
	     */
	    @RequestMapping("/getHos")
	    @ResponseBody
	    public Map<String,Object> getHouseInfos(){
	        Map<String,Object> mr = new HashMap<String,Object>();
	        List<HouseInfo> r = houseManager.getHouseInfos();
	        mr.put("rows",r);
	        mr.put("total",r.size());
	        return mr;
	    }
	    @RequestMapping(value="/changestatus",method=RequestMethod.POST)
	    @ResponseBody
	    public Map<String,String> changeStatus(@RequestParam("rId") String rId,@RequestParam("param") String param,@RequestParam("value") String value){
	    	Map<String,String> m = new HashMap<String,String>();
	    	boolean r =  houseManager.changeStatus(rId, param, value);
	    	if(r){
	    		m.put("result", "success");
	    	}else{
	    		m.put("result", "failer");
	    	}
	    	return m;
	    	
	    }	
	    /**
	     * 
	     * @description 前端展示获取数据
	     * @user yzYang
	     * @date 2014年8月16日
	     * @param hid
	     * @return
	     *
	     */
	    @RequestMapping("/obtainHouseInfo")
	    @ResponseBody
	    public HouseInfo obtainHouseInfo(@RequestParam("hid") String hid){
	    	
	        HouseInfo houseInfo = houseManager.getHouseInfo(hid);
	        return houseInfo;
	    }
	    

	    /**
	     * 
	     * @description 后台管理 
	     * @user yzYang
	     * @date 2014年8月16日
	     * @param t 类型 0 add, 1 edit
	     * @param id
	     * @param model
	     * @return
	     *
	     */
	    @RequestMapping("/roomInfoAddEdit")
	    public String addEditHouseInfo(@RequestParam("t") String t,@RequestParam(value="id", required=false) String id,ModelMap model){
	    	 List<String> roomType = new  ArrayList<String>();
	    	 roomType.add("");
	    	   Map<String,String> list = new LinkedHashMap<String,String>();
	    	   list.put("obuliding", "办公楼");
	    	   list.put("aparent", "公寓");
	    	   list.put("villa", "别墅");
	    	logger.info(t);
	    	logger.info(id);
	    	HouseInfo houseInfo =  new HouseInfo();
	    	logger.info("new==="+houseInfo.getId());
	    	if(!ADD_CODE.equals(t)){
	    		 houseInfo = houseManager.getHouseInfo(id);
	    	}
	    	model.addAttribute("roominfo", houseInfo);
	    	model.addAttribute("t", t);
	    	model.addAttribute("list", list);
	        return "management/roominfoEdit";
	    }
	    
	    /**
	     * 
	     * @description 后台
	     * @user yzYang
	     * @date 2014年8月16日
	     * @param roominfo
	     * @param model
	     * @return
	     *
	     */
	    @RequestMapping(value="/addhouseinfo",method = RequestMethod.POST)
	    public String saveHouseInfo(@ModelAttribute HouseInfo roominfo,Model model){
	        logger.info(roominfo.getId());
	        houseManager.save(roominfo);
	        return "management/roominfo";
	    }

	    /**
	     * 
	     * @description 后台
	     * @user yzYang
	     * @date 2014年8月16日
	     * @param hid
	     *
	     */

	    @RequestMapping("/removeHouseInfo")
	    public String removeHouseInfo(@RequestParam("hid") String hid){
	        houseManager.deleteHouseInfoById(hid);
	        return "management/roominfo";

	    }
	    
	    @ExceptionHandler(RuntimeException.class)  
	    public @ResponseBody  
	    Map<String,Object> runtimeExceptionHandler(RuntimeException runtimeException) {  
	        logger.error(runtimeException.getLocalizedMessage());  
	  
	        Map model = new TreeMap();  
	        model.put("status", false);  
	        return model;  
	    }  
	    
}
