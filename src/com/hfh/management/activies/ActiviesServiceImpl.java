package com.hfh.management.activies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ActiviesServiceImpl implements ActiviesService {

	@Autowired
	private ActiviesDao activiesDao;
	
	@Override
	public List<Activies> getAllActivies() {
		List<Activies> lac = activiesDao.getAllActivies();
		return lac;
	}

	@Override
	public Activies getActivies(String id) {
		Activies ac = activiesDao.getActivies(id);
		return ac;
	}

	@Override
	public boolean saveActivies(Activies ac) {
		
		if(activiesDao.isExit(ac.getId())){
			return activiesDao.updateActivies(ac);
		}else{
			return activiesDao.addActivies(ac);
		}
	}

	@Override
	public boolean deleteActivies(String id) {
		return activiesDao.deleteActivies(id);
	}
	
	/**
	 *  获取首页的信息
	 */
	 public List<Activies> gethomeAc (){
		 return activiesDao.gethomeAc();
	 }
	 
	public List<Activies> getActiviesByPage(String start, String limit,String pageNo){
		 List<Activies> r = activiesDao.getActiviesByPage( start,  limit, pageNo);
		return r;
	}

}
