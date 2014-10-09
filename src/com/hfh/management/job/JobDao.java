package com.hfh.management.job;

import java.util.List;



import com.hfh.bean.Job;

public interface JobDao {
	
	/**
	 * 
	 * @description 新增修改招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param job
	 * @return
	 */
	public boolean addAndEditJob(final Job job);
	
	/**
	 * 
	 * @description 删除招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @return
	 */
	public boolean deleteJob(String id);
	
	/**
	 *  
	 * @description 改变招聘信息的状态
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @param status
	 * @return
	 */
	public boolean changeStatus(String id,String status);
	
	/**
	 * 
	 * @description 获取指定的招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @return
	 */
	public Job getJob(String id);
	
	/**
	 * 
	 * @description 获取所有的招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @return
	 */
	public List<Job> getAllJobs();
	
	/**
	 * 
	 * @description 
	 * @user yzYang
	 * @date 2014年9月2日
	 * @return
	 */
	public List<Job> getJobs();
	
	public List<Job> getJobs(String status);
	
	public boolean isExit(String id );
	
	public boolean updateJob(final Job job);
}
