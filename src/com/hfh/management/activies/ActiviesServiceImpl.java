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

}
