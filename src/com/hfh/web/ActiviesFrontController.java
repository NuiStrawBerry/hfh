package com.hfh.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.management.activies.Activies;
import com.hfh.management.activies.ActiviesService;
import com.hfh.util.ListPageModel;

@Controller
public class ActiviesFrontController {

	@Autowired
	ActiviesService activiesService;;
	  
	  @RequestMapping(value="/getActiviesList",method = RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object> getOffers(@RequestParam("pageNo") String pageNo,
				@RequestParam("limit") String limit){
//	       List<Activies> ac= activiesService.getActiviesByPage("",limit,pageNo);
	       List<Activies> ac= activiesService.getAllActivies();
	       Map<String,Object> page = new HashMap<String,Object>();
			ListPageModel pm = new ListPageModel(ac, 10);
			List sublist = pm.getObjects(Integer.parseInt(pageNo));
			page.put("result", sublist);
			page.put("totalPage", pm.getTotalPages());
			page.put("curPage", pm.getPage());
			page.put("totalCount", pm.getTotalRows());
			return page;
	    }
	  
	  @RequestMapping(value="/activiesDetail",method = RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object> acDetail(@RequestParam("params") String id,
				@RequestParam(value="where",required=false) String where){
		  Map<String,Object> result = new HashMap<String,Object>();
		  Activies  activies = activiesService.getActivies(id);
		 result.put("activies", activies);
		 if(StringUtils.isNotBlank(where)){
			 result.put("where", "home");
		 }
			return result;
	    }
	 
}
