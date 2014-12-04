package com.hfh.management.houseinfo.dao.impl;

import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.dao.HouseInfoDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class HouseInfoDaoImpl  implements HouseInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void addHouseInfo(final HouseInfo houseInfo) {
		String sql = "INSERT INTO roominfo(id,type,localtion,rental," +
				"title,bedrooms,floorsize,AREA,lease_term,CODE,description,creatime) VALUES (?,?,?,?,?,?,?,?,?,?,?,now());";
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
                public void setValues(PreparedStatement preparedStatement) throws SQLException {
                    preparedStatement.setString(1, houseInfo.getId());
                    preparedStatement.setString(2, houseInfo.getType());
                    preparedStatement.setString(3, houseInfo.getLocation());
                    preparedStatement.setFloat(4, houseInfo.getRental());
                    preparedStatement.setString(5, houseInfo.getTitle());
                    preparedStatement.setInt(6, houseInfo.getBedroom());
                    preparedStatement.setInt(7,houseInfo.getFloorSize());
                    preparedStatement.setFloat(8, houseInfo.getArea());
                    preparedStatement.setInt(9, houseInfo.getLeaseTrem());
                    preparedStatement.setString(10, houseInfo.getCode());
                    preparedStatement.setString(11, houseInfo.getDestription());
                }
            });
	}

	@Override
	public boolean changeStatus(String rId,String p,String value) {
		String sql = "update roominfo set "+p+"=? where id=?";
		return  jdbcTemplate.update(sql,new Object[]{value,rId})>0?true:false;
	}

	@Override
	public void deleteHouseInfoById(String id) {
        String sql = "delete from roominfo where id = ?";
        jdbcTemplate.update(sql,new Object[]{id});

	}

	@Override
	public void deleteHouseInfos() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateHouseInfo(final HouseInfo houseInfo) {
		String sql = "update roominfo set code=?, type=?, localtion=?, rental=?,  title=?, bedrooms=?, floorsize=?, area=?, lease_term=?, description=? where id=?";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
            	preparedStatement.setString(1, houseInfo.getCode());
                preparedStatement.setString(2, houseInfo.getType());
                preparedStatement.setString(3, houseInfo.getLocation());
                preparedStatement.setFloat(4, houseInfo.getRental());
                preparedStatement.setString(5, houseInfo.getTitle());
                preparedStatement.setInt(6, houseInfo.getBedroom());
                preparedStatement.setInt(7,houseInfo.getFloorSize());
                preparedStatement.setFloat(8, houseInfo.getArea());
                preparedStatement.setInt(9, houseInfo.getLeaseTrem());
//                preparedStatement.setInt(10, houseInfo.getLeaseStatus());
//                preparedStatement.setString(11, houseInfo.getIsTopShow());
//                preparedStatement.setString(12, houseInfo.getIsHot());
                preparedStatement.setString(10, houseInfo.getDestription());
                preparedStatement.setString(11, houseInfo.getId());
            }
        });
		
	}

    @Override
    public List<HouseInfo> getHouseInfoList() {
        String sql = "SELECT t.title,t.rental,t.type,t.bedrooms,t.code,t.floorsize,t.area,t.id,t.localtion,t.description,t.lease_term, t.lease_status, t.isTopShow, t.ishot,t.creatime"+
        		" FROM roominfo t ORDER BY isTopShow DESC,t.creatime DESC";
        List<HouseInfo> result = jdbcTemplate.query(sql,new HouseInfoRowMapper());
        return result;
    }

    public HouseInfo getHouseInfoById(String id){
        String sql = "SELECT id,TYPE,localtion,rental,title,bedrooms,floorsize,AREA,lease_term," +
                " lease_status,CODE,description,title, isTopShow, ishot,creatime FROM roominfo where id = ?";
       HouseInfo houseInfo = jdbcTemplate.queryForObject(sql,new HouseInfoRowMapper(),id);
        return  houseInfo;
    }

    public boolean isExit(String id ){
    	String sql = "select count(id) from roominfo where id = ?";
    	
    	return jdbcTemplate.queryForObject(sql, Integer.class, id)>0?true:false;
    	// true;
    }
    //map row
    protected class HouseInfoRowMapper implements RowMapper<HouseInfo>{
        public HouseInfo mapRow(ResultSet rs,int rowNum) throws SQLException {
            HouseInfo hs  = new HouseInfo();
            hs.setId(rs.getString("id"));
            hs.setType(rs.getString("type"));
            hs.setLocation(rs.getString("localtion"));
            hs.setDestription(rs.getString("description"));
            hs.setLeaseStatus(rs.getInt("lease_status"));
            hs.setArea(rs.getFloat("AREA"));
            hs.setFloorSize(rs.getInt("floorSize"));
            hs.setTitle(rs.getString("title"));
            hs.setRental(rs.getFloat("rental"));
            hs.setCode(rs.getString("code"));
            hs.setLeaseTrem(Integer.parseInt(rs.getString("lease_term")));
            hs.setCreateTime(rs.getString("creatime"));
            hs.setIsHot(rs.getString("ishot"));
            hs.setIsTopShow(rs.getString("isTopShow"));
            return hs;
        }
    }

    @Override
    public List<HouseInfo> getTopHouseInfoList() {
        String sql = "select id, type, localtion, rental, bedrooms, floorsize, area, lease_term, lease_status, code, description, title,ishot,isTopShow,creatime FROM roominfo ORDER BY creatime limit 8";
        
        List<HouseInfo> result =jdbcTemplate.query(sql, new HouseInfoRowMapper()); 
        	//jdbcTemplate.queryForList(sql, HouseInfo.class);
        return result;
    }
    
    public List<HouseInfo> getTopHouseInfoList(String type,int pageSize,int limit) {
    	List params = new ArrayList();
    	
        String sql = "select id, type, localtion, rental, bedrooms, floorsize, area, lease_term, lease_status, code, description,ishot,isTopShow, title,creatime FROM roominfo ";
        StringBuffer sb = new StringBuffer(sql);
        if(StringUtils.isNotBlank(type)){
        	sb.append(" where type=?");
        	params.add(type);
        }
        sb.append(" ORDER BY creatime DESC limit ?, ?");
        params.add(pageSize);
        params.add(limit);
        
        List<HouseInfo> result =jdbcTemplate.query(sb.toString(), new HouseInfoRowMapper(),params.toArray()); 
        	//jdbcTemplate.queryForList(sql, HouseInfo.class);
        return result;
    }

	@Override
	public List<HouseInfo> getHouseInfoByConditions(String keyWords,
			String type, String location, String bedrooms, String minRetal,
			String maxRetal, String minFloorSize, String maxFloorSize) {
		List<String> params = new ArrayList<String> ();
		String sql = "SELECT t.title,t.rental,t.type,t.bedrooms,t.code,t.floorsize," +
				"t.area,t.id,t.localtion,t.description,t.lease_term, t.lease_status,ishot,isTopShow,creatime FROM roominfo t where 1=1";
		StringBuffer sb = new StringBuffer(sql);
		
		if(StringUtils.isNotBlank(type) && !"all".equals(type)){
			sb.append(" and t.type=?");
			params.add(type);
		}
		if(StringUtils.isNotBlank(location) && !"all".equals(location)){
			sb.append(" and t.localtion=?");
			params.add(location);
		}
		if(StringUtils.isNotBlank(bedrooms) && !"all".equals(bedrooms)){
			sb.append(" and t.bedrooms=?");
			params.add(bedrooms);
		}
		if(StringUtils.isNotBlank(minRetal)){
			sb.append(" and t.rental>=?");
			params.add(minRetal);
		}
		if(StringUtils.isNotBlank(maxRetal)){
			sb.append(" and t.rental<=?");
			params.add(maxRetal);
		}
		
		if(StringUtils.isNotBlank(minFloorSize)){
			sb.append(" and t.area>=?");
			params.add(minFloorSize);
		}
		if(StringUtils.isNotBlank(maxFloorSize)){
			sb.append(" and t.area<=?");
			params.add(maxFloorSize);
		}
		/*if(StringUtils.isNotBlank(maxRetal)){
			sb.append(" and t.type=?");
			params.add(maxRetal);
		}*/
		sb.append(" ORDER BY t.creatime DESC");
		
        List<HouseInfo> result = jdbcTemplate.query(sb.toString(),new HouseInfoRowMapper(),params.toArray());
        return result;
	}

	@Override
	public List<HouseInfo> topflowInfo() {
		String sql = "SELECT * FROM roominfo WHERE isTopShow = 1 and lease_status= 0 ORDER BY creatime LIMIT 0,5 ";
		 List<HouseInfo> result =jdbcTemplate.query(sql, new HouseInfoRowMapper()); 
		return result;
	}
	
	@Override
	public List<HouseInfo> popularHouse() {
		String sql = "SELECT * FROM roominfo WHERE ishot = 1 AND lease_status= 0 ORDER BY creatime LIMIT 0,9 ";
		 List<HouseInfo> result =jdbcTemplate.query(sql, new HouseInfoRowMapper()); 
		return result;
	}
}
