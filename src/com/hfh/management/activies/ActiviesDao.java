/**
 * 
 */
package com.hfh.management.activies;

import java.util.List;

/**
 * @author yzYang
 *
 */
public interface ActiviesDao {
	public List<Activies> getAllActivies();
	
	public List<Activies> gethomeAc ();
	
	public Activies getActivies(String id);
	
	public boolean updateActivies(Activies ac);
	public boolean  addActivies(Activies ac);
	
	public boolean deleteActivies(String id);
	
	public boolean isExit(String id);
	public List<Activies> getActiviesByPage(String start, String limit,String pageNo);

}
