package com.hfh.management.onlierequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.OlineRequestBean;
import com.hfh.service.OnlineRequestService;

@Controller
@RequestMapping("/management")
public class OnlieRquestManagementController {
	
	@Autowired
	OnlineRequestService olrs;
	
	 @RequestMapping(value="/onlineRequestInfoList",method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String,Object> getNewsInfo(){
	        Map<String,Object> result = new HashMap<String,Object>();
	        List<OlineRequestBean> r = olrs.getOrInfoList();
	        result.put("rows",r);
	        result.put("total",r.size());
	        return result;
	    }

}
