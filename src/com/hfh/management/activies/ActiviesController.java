package com.hfh.management.activies;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Controller
@RequestMapping("/management")
public class ActiviesController {
	
	@Autowired
	ActiviesService activiesService;
	
	private final String LIST_PAGE = "management/activitesList";
	
	private String EDIT_PAGE = "management/activiesEdit";
	/**
     * 
     * @description   后台展示 获取数据
     * @user yzYang
     * @date 2014年11月05日
     * @return
     *
     */
    @RequestMapping(value="/getAllac",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAllAc(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<Activies> r = activiesService.getAllActivies();
        result.put("rows",r);
        result.put("total",r.size());
        return result;
    }
    
    @RequestMapping("/addAc")
	public String addEditJob(@RequestParam(value="id", required=false) String id,ModelMap model){
    	  
    	Activies activies ;
    	if(StringUtils.isNotBlank(id)){
    		activies = activiesService.getActivies(id);
    	}else{
    		activies = new Activies();
    	}
    	model.addAttribute("activies", activies);
        return EDIT_PAGE;
	}
    
    @RequestMapping(value="/saveAc",method = RequestMethod.POST)
    public String saveHouseInfo(@ModelAttribute Activies activies){
    	activiesService.saveActivies(activies);
        return LIST_PAGE;
    }
    
    @RequestMapping("/deleteAc")
    public String removeHouseInfo(@RequestParam("id") String id){
    	activiesService.deleteActivies(id);
        return LIST_PAGE;
    }

}
