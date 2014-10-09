package com.hfh.management.job;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfh.bean.Job;


@Service
public class JobServiceImpl implements JobService{

	private final Logger logger = Logger.getLogger(JobServiceImpl.class);
	@Autowired
	private JobDao jobDao;
	
	/**
	 * @see JobService
	 */
	public boolean addAndEditJob(Job job) {
		
		if(jobDao.isExit(job.getId())){
			return jobDao.updateJob(job);
		}else{
			return jobDao.addAndEditJob(job);
		}
	}
	
	@Override
	public boolean deleteJob(String id) {
		return jobDao.deleteJob(id);
	}
	
	@Override
	public boolean changeStatus(String id, String status) {
		return jobDao.changeStatus(id, status);
	}
	
	@Override
	public Job getJob(String id) {
		return jobDao.getJob(id);
	}
	
	@Override
	public List<Job> getAllJobs() {
		return jobDao.getAllJobs();
	}
	
	@Override
	public List<Job> getJobs() {
		return jobDao.getJobs();
	}
	
	@Override
	public List<Job> getJobs(String status) {
		return jobDao.getJobs(status);
	}
}
