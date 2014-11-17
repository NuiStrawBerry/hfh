package com.hfh.management.activies;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ActiviesDaoImpl implements ActiviesDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Activies> getAllActivies() {
		String sql = "select * from t_activies order by acreatetime desc";
		List<Activies> acs = jdbcTemplate.query(sql,new ActiviesRowMapper());
		return acs;
	}
	
	 public List<Activies> gethomeAc (){
		 String sql = "select * from t_activies order by acreatetime desc limit 10";
			List<Activies> acs = jdbcTemplate.query(sql,new ActiviesRowMapper());
			return acs;
	 }
	@Override
	public Activies getActivies(String id) {
		String sql = "select * from t_activies where id = ?";
		Activies acs = jdbcTemplate.queryForObject(sql,new ActiviesRowMapper() ,id);
		return acs;
	}

	@Override
	public boolean updateActivies(Activies ac) {
		String sql = "update t_activies set actitle = ?,acontent = ? ,actime= ? where id =?";
		int r = jdbcTemplate.update(sql, new Object[]{ac.getTitle(),ac.getContent(),ac.getActivieTime(),ac.getId()});
		return r>0?true:false;
	}

	@Override
	public boolean addActivies(final Activies ac) {
		String sql = "INSERT INTO t_activies (actitle,acontent, actime , acreater,acreatetime) VALUES (?,?,?,?,now());";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement ps) throws SQLException {
            	ps.setString(1, ac.getTitle());
            	ps.setString(2,ac.getContent());
            	ps.setString(3,ac.getActivieTime());
            	ps.setString(4,ac.getCreater());
            //	ps.setString(5,ac.getCreateTime());
            }
        });
		return r>0?true:false;
	}

	@Override
	public boolean deleteActivies(String id) {
		String sql = "delete from t_activies where id = ?";
		int r = jdbcTemplate.update(sql,new Object[]{id});
		return r>0?true:false;
	}

	@Override
	public boolean isExit(String id) {
		String sql = "select count(id) from t_activies where id= ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id)>0?true:false;
	}
	
	public List<Activies> getActiviesByPage(String start, String limit,String pageNo){
			 String sql = "select * from t_activies order by acreatetime desc limit ?,?";
				List<Activies> acs = jdbcTemplate.query(sql,new ActiviesRowMapper(), new Object[]{(Integer.parseInt(pageNo)-1)*Integer.parseInt(limit),Integer.parseInt(limit)});
				return acs;
	}

}
