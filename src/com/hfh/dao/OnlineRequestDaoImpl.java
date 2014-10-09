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

@Transactional
@Service
public class OnlineRequestDaoImpl implements OnlineRequestDao {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
	public void saveOrInfo(final OlineRequestBean ori) {
		
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
	                preparedStatement.setDate(11, new Date( ori.getArrvalDate().getTime()));
	                preparedStatement.setInt(12, ori.getMinRentalBudget());
	                preparedStatement.setDate(13, new Date(ori.getMoveInDate().getTime()));
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

	@Override
	public List<OlineRequestBean> getOrInfoList() {
		String sql = "SELECT * FROM t_onlie_request";
        List<OlineRequestBean> olineRequestBean =jdbcTemplate.query(sql, new OnlieRequestRowMapper()); 
		return olineRequestBean;
	}

	/*@Override
	public OrInfo getOrInfoById(String id) {
		return null;
	}*/

}
