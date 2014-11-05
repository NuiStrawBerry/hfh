package com.hfh.management.web;



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management")
public class ManagementController {

	 protected final Log logger = LogFactory.getLog(getClass());
	 	@RequestMapping("/index")
	    public String indexPage (){
	        return "management/index";
	    }
	 	
		@RequestMapping("/roominfo")
	    public String roominfoPage (){
	        return "management/roominfo";
	    }
		
		@RequestMapping("/joblist")
	    public String jobList (){
	        return "management/jobList";
	    }
		
		@RequestMapping("/binquiry")
	    public String binquiryPage (){
	        return "management/binquiry";
	    }
		
		@RequestMapping("/menu")
		public String menu(){
			return "management/menu";
		}
		
		@RequestMapping(value="/newslist")
	    public String newsList (){
	        return "management/newsList";
	    }
		
		@RequestMapping(value="/activieslist")
	    public String activieslist (){
	        return "management/activitesList";
	    }
		
		@RequestMapping(value="/onlinerequest")
	    public String onlineRequest (){
	        return "management/onlineRList";
	    }
		
		@RequestMapping(value="/emailagent")
	    public String emailagent (){
	        return "management/emailAgentList";
	    }
}
