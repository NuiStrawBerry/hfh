package com.hfh.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hfh.bean.OlineRequestBean;
import com.hfh.management.onlierequest.OnlieRequestRowMapper;

/**
 * @author yzYang
 *
 */
@Transactional
@Service
public class OnlineRequestDaoImpl implements OnlineRequestDao {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
	public void saveOrInfo(final OlineRequestBean ori) {
		//TODO  搬进日期和到底日期需要 经一部的处理
		String sql = "insert into t_onlie_request (wid, otherHearFrom, hearFrom, uname, nationality, position, "+
		"company, email, fax, tel, mobile, arrvalDate, minRentalBudget, moveInDate, maxRentalBudget, leaseTerm, preferLocation, preferTypes, "+
		"hasPet, homeFurnished, bedrooms, comments) values (UUID(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
	        jdbcTemplate.update(sql, new PreparedStatementSetter() {
	            public void setValues(PreparedStatement preparedStatement) throws SQLException {
	                preparedStatement.setString(1, ori.getOtherHearFrom());
	                preparedStatement.setString(2, ori.getHearFrom());
	                preparedStatement.setString(3, ori.getName());
	                preparedStatement.setString(4, ori.getNationality());
	                preparedStatement.setString(5, ori.getPosition());
	                preparedStatement.setString(6, ori.getCompany());
	                preparedStatement.setString(7, ori.getEmail());
	                preparedStatement.setString(8, ori.getFax());
	                preparedStatement.setString(9, ori.getTel());
	                preparedStatement.setString(10, ori.getMobile());
	                preparedStatement.setString(11, ori.getArrvalDate());
	                preparedStatement.setInt(12, ori.getMinRentalBudget());
	                preparedStatement.setString(13, ori.getMoveInDate());
	                preparedStatement.setInt(14, ori.getMaxRentalBudget());
	                preparedStatement.setString(15, ori.getLeaseTerm());
	                preparedStatement.setString(16, ori.getPreferLocation());
	                preparedStatement.setString(17, ori.getPreferTypes());
	                preparedStatement.setString(18, ori.getHasPet());
	                preparedStatement.setString(19, ori.getHomeFurnished());
	                preparedStatement.setInt(20, ori.getBedrooms());
	                preparedStatement.setString(21, ori.getComments());
	            }
	        });
	}
	
	/**
	 * 获取所有的在线要求的信息
	 */
	@Override
	public List<OlineRequestBean> getOrInfoList() {
		String sql = "SELECT * FROM t_onlie_request";
        List<OlineRequestBean> olineRequestBean =jdbcTemplate.query(sql, new OnlieRequestRowMapper()); 
		return olineRequestBean;
	}
	/**
	 *  获取在线要求的详情
	 */
	@Override
	public OlineRequestBean getOrInfoDetail(String id) {
		String sql = "SELECT * FROM t_onlie_request where wid=?";
        OlineRequestBean olineRequestBean = jdbcTemplate.queryForObject(sql, new Object[]{id},new OnlieRequestRowMapper()); 
		return olineRequestBean;
	}

}
