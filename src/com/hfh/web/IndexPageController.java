package com.hfh.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hfh.management.houseinfo.service.HouseManager;

/**
 * Created by yzYang on 14-2-18.
 */
@Controller
public class IndexPageController {

    @Autowired
    private HouseManager houseManager;

    @RequestMapping(value="/index")
    public String indexPage(ModelMap model){
        model.put("currentPage","index");
        return "index";
    }

    @RequestMapping(value="/aboutus",method = RequestMethod.GET)
    public String aboutUs(HttpServletRequest request, HttpServletResponse response,ModelMap model){
    	String tabs = request.getParameter("tabs");
    	 model.addAttribute("currentPage","aboutus");
    	 model.put("tabs",tabs);
        return "aboutus";
    }

    @RequestMapping(value="/team",method = RequestMethod.GET)
    public String team(Model model){
    	 model.addAttribute("currentPage","team");
        return "team";
    }

    @RequestMapping(value="/contact",method = RequestMethod.GET)
    public String contact(Model model){
    	 model.addAttribute("currentPage","contact");
        return "contact";
    }

    @RequestMapping(value="/ourservice",method = RequestMethod.GET)
    public String ourservice(Model model){
    	 model.addAttribute("currentPage","ourservice");
        return "ourservice";
    }
    
    @RequestMapping(value="/rentalist",method = RequestMethod.GET)
    public String rentInfoList(HttpServletRequest request, HttpServletResponse response,Model model){
    	String tabs = request.getParameter("tabs");
    	 model.addAttribute("currentPage","rentalist");
    	 model.addAttribute("tabs",tabs);
        return "rentInfoList";
    }
    
    @RequestMapping(value="/onlierequest")
    public String onlieRequest(Model model){
   	 model.addAttribute("currentPage","onlineRequest");
       return "onlineRequest";
   }
    
  /*  @RequestMapping(value="/index",method = RequestMethod.GET)
    public String indexPage(){

        return "index";
    }*/
}
