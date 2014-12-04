package com.hfh.management.job;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hfh.bean.Job;

public class JobRowMapper  implements RowMapper<Job>{
	@Override
	public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
		Job job = new Job();
		job.setId(rs.getString("id"));
		job.setTitle(rs.getString("title"));
		job.setContent(rs.getString("content"));
		job.setCreatime(rs.getString("creatime"));
		job.setStatus(rs.getString("status"));
		return job;
	}

}
