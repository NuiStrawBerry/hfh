package com.hfh.management.activies;

import java.util.List;

public interface ActiviesService {

	public List<Activies> getAllActivies();
	
	public List<Activies> gethomeAc ();
	
	public Activies getActivies(String id);
	
	public boolean saveActivies(Activies ac);
	
	public boolean deleteActivies(String id);
	
	public List<Activies> getActiviesByPage(String start, String limit,String pageNo);
}
