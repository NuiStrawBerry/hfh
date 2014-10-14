package com.hfh.management.onlierequest;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;

import com.hfh.bean.News;
import com.hfh.bean.OlineRequestBean;

public class OnlieRequestRowMapper  implements RowMapper<OlineRequestBean>{
	@Override
	public OlineRequestBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		OlineRequestBean orb = new OlineRequestBean();
		orb.setArrvalDate(rs.getString("arrvalDate"));
		orb.setBedrooms(rs.getInt("bedrooms"));
		orb.setComments(rs.getString("comments"));
		orb.setCompany(rs.getString("company"));
		orb.setEmail(rs.getString("email"));
		orb.setFax(rs.getString("fax"));
		orb.setHasPet(rs.getString("hasPet"));
		orb.setHearFrom(rs.getString("hearFrom"));
		orb.setHomeFurnished(rs.getString("homeFurnished"));
		orb.setLeaseTerm(rs.getString("leaseTerm"));
		orb.setMaxRentalBudget(rs.getInt("maxRentalBudget"));
		orb.setMinRentalBudget(rs.getInt("minRentalBudget"));   
		orb.setMobile(rs.getString("mobile"));
		orb.setMoveInDate(rs.getString("moveInDate"));
		orb.setName(rs.getString("uname"));
		orb.setNationality(rs.getString("nationality"));
		orb.setOtherHearFrom(rs.getString("otherHearFrom"));
		orb.setPosition(rs.getString("position"));
		orb.setPreferLocation(rs.getString("preferLocation"));
		orb.setPreferTypes(rs.getString("preferTypes"));
		orb.setTel(rs.getString("tel"));
		orb.setId(rs.getString("wid"));
		return orb;
	}

}
