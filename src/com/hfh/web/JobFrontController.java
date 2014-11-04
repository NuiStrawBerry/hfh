package com.hfh.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.Job;
import com.hfh.management.job.JobService;

@Controller
public class JobFrontController {

	@Autowired
	JobService jobService;
	  
	  @RequestMapping(value="/offers",method = RequestMethod.POST)
	  @ResponseBody
	  public  List<Job> getOffers(){
	       List<Job> jobs= jobService.getJobs();
	        return jobs;
	    }
	  
	 
}
