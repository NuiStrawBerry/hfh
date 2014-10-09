package com.hfh.management.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.Job;


@Controller
@RequestMapping("/management")
public class JobController {
	
	@Autowired
	JobService jobService;
	
	@RequestMapping("/alljobs")
	public void getAllJobs(){
		
	}
	
	public void getJob(){
		
	}
	
	public void deleteJob(){
		
	}
	
    /**
     * 
     * @description   后台展示 获取数据
     * @user yzYang
     * @date 2014年8月16日
     * @return
     *
     */
    @RequestMapping("/jobList")
    @ResponseBody
    public Map<String,Object> getHouseInfos(){
        Map<String,Object> mr = new HashMap<String,Object>();
        List<Job> r = jobService.getAllJobs();
        mr.put("rows",r);
        mr.put("total",r.size());
        return mr;
    }
	
	@RequestMapping("/addJobs")
	public String addEditJob(@RequestParam(value="id", required=false) String id,ModelMap model){
		
    	Job job ;//=  new Job();
    	if(StringUtils.isNotBlank(id)){
    		 job = jobService.getJob(id);
    	}else{
    		job = new Job();
    	}
    	model.addAttribute("job", job);
        return "management/jobEdit";
	}
	
    @RequestMapping(value="/saveJob",method = RequestMethod.POST)
    public String saveHouseInfo(@ModelAttribute Job job){
        jobService.addAndEditJob(job);
        return "management/jobList";
    }
    
    @RequestMapping("/deleteJobs")
    public String deleteJobs(@RequestParam("hid") String id){
    	jobService.deleteJob(id);
        return "management/jobList";

    }
    
    @RequestMapping(value="/jobStatusChange",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> jobStatusChange(@RequestParam("rId") String nId,@RequestParam("value") String v){
    	Map<String,String> r = new HashMap<String,String>();
    	boolean result = jobService.changeStatus(nId, v);
    	if(result){
    		r.put("result", "success");
    	}else{
    		r.put("result", "failer");
    	}
        return r;
    }

}
