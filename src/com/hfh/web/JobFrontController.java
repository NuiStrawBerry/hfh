package com.hfh.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.Job;
import com.hfh.management.job.JobService;

@Controller
public class JobFrontController {

	@Autowired
	JobService jobService;
	  
	  @RequestMapping(value="/offers",method = RequestMethod.GET)
	    public String getOffers(@RequestParam("id") String id, Model model){
	       List<Job> jobs= jobService.getAllJobs();
	        model.addAttribute(jobs);//("houseInfo",result);
	       
	        return "jobs";
	    }
	  
	  
	  /*  @RequestMapping(value="/fhouseinfodetail",method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String,HouseInfo> getHouseInfoDetail(@RequestParam("id") String id ){
	        Map<String,HouseInfo> r = new HashMap<String,HouseInfo>();
	       // HouseInfo result = houseManager.getHouseInfo(id);
	       // r.put("houseInfo",result);
	        return r;
	    }*/
}
