package com.hfh.management.news;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.News;


@Controller
@RequestMapping("/management")
public class NewsController {
	
	@Autowired
	NewsService newService;
	
	private final String REAL_ESTATE_NEWS = "1";
	private final String WEEKLY_Events = "2";
	private final String HOT = "3";
	@RequestMapping("/allNews")
	public void getAllJobs(){
		
	}
	
    /**
     * 
     * @description   后台展示 获取数据
     * @user yzYang
     * @date 2014年8月16日
     * @return
     *
     */
    @RequestMapping(value="/newsList",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getNewsInfo(){
        Map<String,Object> result = new HashMap<String,Object>();
        List<News> r = newService.getAllNews();
        result.put("rows",r);
        result.put("total",r.size());
        return result;
    }
	
	@RequestMapping("/addNews")
	public String addEditJob(@RequestParam(value="id", required=false) String id,ModelMap model){
		 List<String> type = new  ArrayList<String>();
		 type.add("");
    	   Map<String,String> list = new LinkedHashMap<String,String>();
    	   list.put(REAL_ESTATE_NEWS, "REAL_ESTATE_NEWS");
    	   list.put(WEEKLY_Events, "WEEKLY_Events");
    	   list.put(HOT, "HOT");
    	News news ;//=  new Job();
    	if(StringUtils.isNotBlank(id)){
    		news = newService.getNews(id);
    	}else{
    		news = new News();
    	}
    	model.addAttribute("news", news);
    	model.addAttribute("list", list);
        return "management/newsEdit";
	}
	
    @RequestMapping(value="/saveNews",method = RequestMethod.POST)
    public String saveHouseInfo(@ModelAttribute News news){
    	newService.addAndEditNews(news);
        return "management/newsList";
    }
    
    @RequestMapping("/deleteNews")
    public String removeHouseInfo(@RequestParam("hid") String id){
    	newService.deleteNews(id);
        return "management/newsList";

    }
    
    @RequestMapping(value="/newStatusChange",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> newsStatusChange(@RequestParam("nId") String nId,@RequestParam("value") String v){
   // public Map<String,String> newsStatusChange(HttpServletRequest request, HttpServletResponse response){
//    	String nId = request.getParameter("nId");
//    	String v = request.getParameter("value");
    	Map<String,String> r = new HashMap<String,String>();
    	boolean result = newService.changeStatus(nId, v);
    	if(result){
    		r.put("result", "success");
    	}else{
    		r.put("result", "failer");
    	}
        return r;
    }

}
