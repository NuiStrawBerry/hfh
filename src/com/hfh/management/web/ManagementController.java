package com.hfh.management.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		@RequestMapping("/binquiry")
	    public String binquiryPage (){
	        return "management/binquiry";
	    }
		
		@RequestMapping("/menu")
		public String menu(){
			return "management/menu";
		}
		
}
