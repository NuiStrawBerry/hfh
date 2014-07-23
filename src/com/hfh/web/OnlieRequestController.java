package com.hfh.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.OlineRequestBean;
import com.hfh.service.OnlineRequestService;

@Controller
public class OnlieRequestController{
	
	@Autowired
	OnlineRequestService olrs;
	
	@RequestMapping(value="/onlineRequest",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> submit(@RequestParam("hearfrom") String hearfrom,
			@RequestParam("name") String name,
			@RequestParam("company") String company,
			@RequestParam("email") String email,
			@RequestParam("fax") String fax,
			@RequestParam("nationality") String nationality,
			@RequestParam("arrival") String arrival,
			@RequestParam("position") String position,
			@RequestParam("tel") String tel,
			@RequestParam("mob") String mob,
			@RequestParam("movein") String movein,
			@RequestParam("maxbudget") String maxbudget,
			@RequestParam("minbudget") String minbudget,
			@RequestParam("leaseterm") String leaseterm,
			@RequestParam("location") String location,
			@RequestParam("propertyType") String propertyType,
			@RequestParam("bedrooms") String bedrooms,
			@RequestParam("furnished") String furnished,
			@RequestParam("pet") String pet,
			@RequestParam("additional") String additional,
			@RequestParam("other") String other
			){
		
				OlineRequestBean orb = new OlineRequestBean() ;
				orb.setArrvalDate(new Date());
				//orb.setBedrooms(bedrooms);
				orb.setComments(additional);
				orb.setCompany(company);
				orb.setEmail(email);
				orb.setFax(fax);
				orb.setHasPet(pet);
				//orb.setHearFrom(hearfrom);
				orb.setHomeFurnished(furnished);
				orb.setLeaseTerm(leaseterm);
				if(StringUtils.isNotBlank(maxbudget))
				orb.setMaxRentalBudget(Integer.valueOf(maxbudget));
				if(StringUtils.isNotBlank(minbudget))
				orb.setMinRentalBudget(Integer.valueOf(minbudget));
				orb.setMobile(mob);
				orb.setMoveInDate(new Date());
				orb.setName(name);
				orb.setNationality(nationality);
				orb.setOtherHearFrom(other);
				orb.setPreferLocation(location);
				//orb.setPreferTypes(propertyType);
				orb.setTel(tel);
				
				olrs.saveInfo(orb);
				
				Map<String,String> result = new HashMap<String,String>();
				System.out.println("hearfrom=========="+hearfrom);
				System.out.println("propertyType=========="+propertyType);
				
				result.put("result", "success");
				result.put("resCode", "0");
				return result;
				
		
	}
	
	

}
