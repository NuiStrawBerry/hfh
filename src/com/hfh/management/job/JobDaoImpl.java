package com.hfh.management.job;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hfh.bean.Job;


@Transactional
@Service
public class JobDaoImpl implements JobDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean addAndEditJob(final Job job){
		
		String sql = "insert into t_jobs(title,content,creatime)values(?,?,now())";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement ps) throws SQLException {
            	ps.setString(1, job.getTitle());
            	ps.setString(2,job.getContent() );
            }
        });
		return r>0?true:false;
	}
	
	public boolean updateJob(final Job job){
		String sql = "update t_jobs set title = ?,content = ? where id = ?";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1, job.getTitle());
                preparedStatement.setString(2,job.getContent() );
                preparedStatement.setString(3,job.getId());
            }
        });
		return r>0?true:false;
	}
	
	public boolean deleteJob(String id){
		String sql = "delete from t_jobs where id = ?";
		int r = jdbcTemplate.update(sql,new Object[]{id});
		return r>0?true:false;
	}
	
	public boolean changeStatus(String id,String status){
		String sql = "update t_jobs set status = ? where id = ?";
		int r = jdbcTemplate.update(sql,new Object[]{status,id});
		return r>0?true:false;
	}
	
	public Job getJob(String id){
		  String sql = "SELECT id,title,content,creatime,status FROM t_jobs where id = ?";
		  Job job = jdbcTemplate.queryForObject(sql,new JobRowMapper(),id);
		  return  job;
	}
	
	/**
	 * @see 
	 */
	public List<Job> getAllJobs(){
		
	 	String sql = "select * from t_jobs order by creatime desc";
        List<Job> result =jdbcTemplate.query(sql, new JobRowMapper()); 
        return result;
	}
	
	/**
	 * @see 
	 */
	public List<Job> getJobs(){
		String sql = "select * from t_jobs where status='1' order by creatime desc";
        List<Job> result =jdbcTemplate.query(sql, new JobRowMapper()); 
        return result;
	}
	
	public List<Job> getJobs(String status){
		String sql = "select * from t_jobs where status='1' order by creatime desc";
        List<Job> result =jdbcTemplate.query(sql, new JobRowMapper()); 
        return result;
	}
	
    public boolean isExit(String id ){
    	String sql = "select count(id) from t_jobs where id = ?";
    	
    	return jdbcTemplate.queryForObject(sql, Integer.class, id)>0?true:false;
    	// true;
    }
	
}
