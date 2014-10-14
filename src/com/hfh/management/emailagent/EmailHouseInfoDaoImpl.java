package com.hfh.management.emailagent;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hfh.bean.EmailedHouse;
import com.hfh.bean.OlineRequestBean;
import com.hfh.management.onlierequest.OnlieRequestRowMapper;

@Transactional
@Service
public class EmailHouseInfoDaoImpl implements EmailHouseInfoDao {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
	public void saveEmialedHouseInfo(final EmailedHouse eh) {
		
		// String sql = "INSERT INTO emailed_house_info (wid,houseid,email,phone,message,fullname) VALUES(UUID(),UUID(),'yyz@123.com','13952064641','message','jonas')";
		 String sql = "INSERT INTO emailed_house_info (wid,houseid,email,phone,message,fullname,sendtime) VALUES(UUID(),?,?,?,?,?,NOW())";
	        jdbcTemplate.update(sql, new PreparedStatementSetter() {
	            public void setValues(PreparedStatement preparedStatement) throws SQLException {
	                preparedStatement.setString(1, eh.getHouseId());
	                preparedStatement.setString(2, eh.getEmail());
	                preparedStatement.setString(3, eh.getPhone());
	                preparedStatement.setString(4, eh.getMessage());
	                preparedStatement.setString(5, eh.getFullname());
	            }
	        });
		
	}

	@Override
	public List<EmailedHouse> getEmailedHouseList() {
		String sql = "select * from emailed_house_info";
		List<EmailedHouse> eh =jdbcTemplate.query(sql, new EmailAgentRowMapper()); 
		return eh;
	}

	@Override
	public EmailedHouse getEmailedHouseById(String id) {
		String sql = "select * from emailed_house_info where wid = ?";
		EmailedHouse eh = jdbcTemplate.queryForObject(sql, new Object[]{id},new EmailAgentRowMapper()); 
		return eh;
	}


	@Override
	public void delteEmialedById(String id) {
		
	}
	/**
	 * 获取所有的在线要求的信息
	 */

}
