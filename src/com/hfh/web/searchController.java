package com.hfh.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.service.HouseManager;
import com.hfh.util.ListPageModel;

@Controller
public class searchController {

	@Autowired
    private HouseManager houseManager;
	
	@RequestMapping(value="/search",method = RequestMethod.GET)
	public String searchPage(){
		return "searchlist";
	}
	
	@RequestMapping(value="/search",method = RequestMethod.POST)
	//@ResponseBody
	public String searchR(@RequestParam("type") String type,
			@RequestParam("keywords") String keywords,
			@RequestParam("location") String location,
			@RequestParam("bedrooms") String bedrooms,
			@RequestParam("min-rental") String minRental,
			@RequestParam("max-rental") String maxRental,
			@RequestParam("min-area") String minArea,
			@RequestParam("max-area") String maxArea,
			@RequestParam("pn") String pn,
			@RequestParam("startNum") int start,
			@RequestParam("endNum") int end,
			Model model){
		
		Map<String,Object> page = new HashMap<String,Object>();
		List<HouseInfo> houseInfos = houseManager.getHouseInfoByConditions(keywords,type, location, bedrooms, minRental, maxRental, minArea, maxArea);
		//getHouseInfos();
		pn = StringUtils.isNotBlank(pn)?pn:"1";
		ListPageModel pm = new ListPageModel(houseInfos, 10);
		List<HouseInfo> sublist = pm.getObjects(Integer.parseInt(pn));
		page.put("result", sublist);
		page.put("totalPage", pm.getTotalPages());
		page.put("curPage", pm.getPage());
		page.put("totalCount", pm.getTotalRows());
		pm.getPageEndRow();
		pm.isHasNextPage();
		pm.isHasPreviousPage();
		
		model.addAttribute("result", sublist);
		model.addAttribute("totalPage", pm.getTotalPages());
		model.addAttribute("curPage", pm.getPage());
		model.addAttribute("totalCount", pm.getTotalRows());
		model.addAttribute("totalCount", pm.getPageStartRow());
		pm.description();
		model.addAttribute("type", type);
		model.addAttribute("keywords", keywords);
		model.addAttribute("location", location);
		model.addAttribute("bedrooms", bedrooms);
		model.addAttribute("minRental", minRental);
		model.addAttribute("maxRental",maxRental);
		model.addAttribute("minArea", minArea);
		model.addAttribute("maxArea",maxArea);
		Map<String,Integer> r = this.startAndEndNum(start, end, pm.getTotalPages(), pm.getPage());
		model.addAttribute("start",r.get("start"));
		model.addAttribute("end",r.get("end"));
		model.addAttribute("forwardNum",r.get("forwardNum"));
		model.addAttribute("backNum",r.get("backNum"));
		
		return "searchlist";
	}
	
	@RequestMapping(value="/getHibt",method = RequestMethod.POST)
	@ResponseBody
	public Map getHouseInfoListBytype(@RequestParam("type") String type){
		
		Map page = new HashMap();
		List<HouseInfo> houseInfos = houseManager.getHouseInfoByType(type);
		ListPageModel pm = new ListPageModel(houseInfos, 10);
		List sublist = pm.getObjects(1);
		page.put("result", sublist);
		page.put("totalPage", pm.getTotalPages());
		page.put("curPage", pm.getPage());
		page.put("totalCount", pm.getTotalRows());
		return page;
	}
	
	public Map<String,Integer> startAndEndNum(int start,int end, int totalPage,int curPage){
		int forwardNum = end-1;
		int maxShowNum = totalPage<10?totalPage:10;
		int backNum =start+1;
		int step = 2;
		Map<String,Integer> r = new HashMap<String,Integer>();	
		if(curPage ==forwardNum){
			end+=step;
			if(end>totalPage){
				end = totalPage;
				start += totalPage - forwardNum-1;
				forwardNum = 8888888;
			}else{
				start+= step;
				forwardNum +=step;
			}
			backNum = start+1;
		}
		
		if(curPage==backNum){
			 start-= step;
		      if(start<=0){
		    	  start = 1;
		        end -= (backNum-1) - start;
		        backNum = 88888888;
		      }else{
		        backNum -=step;
		        end-=step;
		      }
		      forwardNum = end-1;
		}
		r.put("start", start);
		r.put("end", end);
		r.put("forwardNum", forwardNum);
		r.put("backNum", backNum);
		System.out.println("start = "+start);
		System.out.println("end = "+end);
		System.out.println("forwardNum = "+forwardNum);
		System.out.println("backNum = "+backNum);
		System.out.println("start = "+start);
		return r;
		
	}
	
	
}
