package com.hfh.management.emailagent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.EmailedHouse;
import com.hfh.bean.OlineRequestBean;
import com.hfh.service.OnlineRequestService;

@Controller
@RequestMapping("/management")
public class EmailAgentController {
	
	@Autowired
    private EmailHouseInfoService ehiService;
	
	@RequestMapping(value="/emailAgentList",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getOnlineRequestInfo(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<EmailedHouse> r = ehiService.getEmailedHouseList();
        result.put("rows",r);
        result.put("total",r.size());
        return result;
    }
	
	@RequestMapping(value="/emailAgentDetial",method = RequestMethod.GET)
    public String onlieRDetial(@RequestParam("id") String id,ModelMap model){
		
		EmailedHouse orb = ehiService.getEmailedHouseById(id);
        model.put("orb", orb);
        return 	"management/emailAgentList";
    }

}
