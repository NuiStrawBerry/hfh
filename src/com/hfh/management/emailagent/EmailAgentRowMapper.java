package com.hfh.management.emailagent;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hfh.bean.EmailedHouse;

public class EmailAgentRowMapper  implements RowMapper<EmailedHouse>{
	@Override
	public EmailedHouse mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		EmailedHouse eh = new EmailedHouse();
		eh.setEmail(rs.getString("email"));
		eh.setFullname(rs.getString("fullname"));
		eh.setHouseId(rs.getString("houseid"));
		eh.setId(rs.getString("wid"));
		eh.setMessage(rs.getString("message"));
		eh.setPhone(rs.getString("phone"));
		eh.setHouseTitle(rs.getString("housetitle"));
		eh.setSendTime(rs.getString("sendtime"));
		
		return eh;
	}

}
