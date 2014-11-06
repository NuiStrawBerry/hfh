package com.hfh.management.activies;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class ActiviesRowMapper implements RowMapper<Activies> {

	public Activies mapRow(ResultSet rs, int rowNum) throws SQLException {
		Activies ac = new Activies();
		ac.setActivieTime(rs.getString("actime"));
		ac.setContent(rs.getString("acontent"));
		ac.setCreater(rs.getString("acreater"));
		ac.setCreateTime(rs.getString("acreatetime"));
		ac.setId(rs.getString("id"));
		ac.setTitle(rs.getString("actitle"));
		return ac;
	}

}
