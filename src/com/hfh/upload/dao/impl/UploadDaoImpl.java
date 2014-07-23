package com.hfh.upload.dao.impl;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hfh.bean.FileMeta;
import com.hfh.bean.HouseInfo;
import com.hfh.upload.dao.UploadDao;
import com.hfh.util.PathUtils;

/**
 * Created by yzYang on 14-2-17.
 */

@Transactional
@Service
public class UploadDaoImpl implements UploadDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
	PathUtils pu;

    @Override
    public boolean saveFiles(final FileMeta fm) {
        String sql = "INSERT INTO filesinfo(wid,roominfoid,oriname,changename,filetype) VALUES (?,?,?,?,?);";
        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1, fm.getWid());
                preparedStatement.setString(2, fm.getRoomInfoId());
                preparedStatement.setString(3, fm.getOriName());
                preparedStatement.setString(4, fm.getChangeName());
                preparedStatement.setString(5, fm.getFileType());
            }
        });
        return true;
    }

    @Override
	public boolean deleteFile(String rId, String id,String cname) {
    	boolean result = true;
    	this.removeFile(cname);
		String sql = "delete from filesinfo where wid=? and roominfoid=?";
    	result = this.jdbcTemplate.update(sql, new Object[]{id,rId})>0?true:false;
		return result;
	}
    
    private boolean removeFile(String cname){
		boolean result = false;
		File f = new File(pu.getUploadPath()+cname);
		if(f.exists()){
			result = f.delete();
		}
        return result;
    }
    
	@Override
    public boolean deleteFiles(FileMeta fm) {
		String sql = "select changename from filesinfo where wid=? and roominfoid=?";
		String fileName= this.jdbcTemplate.queryForObject(sql,new Object[]{},String.class);
		boolean result = true;
		String path="D:\temp\files\\";
		path = path+fileName;
		File f = new File(path);
		if(f.exists()){
			result = f.delete();
		}
        return result;
    }

    @Override
    public List<FileMeta> getFiles(String id) {
        return null;
    }

    /**
     * get files by id
     */
    @Override
    public FileMeta getFileById(String fm) {
    	String sql = "select * from filesinfo where wid = ?";
    	return	this.jdbcTemplate.queryForObject(sql, new Object[]{fm}, new FileMetaRowMapper());
    }
    
    
   public List<FileMeta> getFilesByRoomInfoId(String roomInfoId){
        String sql = "select * from filesinfo where roominfoid = ?";
       List<FileMeta> result = jdbcTemplate.query(sql,new Object[]{roomInfoId}, new FileMetaRowMapper());
       return result;
    }
   
   //map row
   protected class FileMetaRowMapper implements RowMapper<FileMeta>{
       public FileMeta mapRow(ResultSet rs,int rowNum) throws SQLException {
    	   FileMeta hs  = new FileMeta();
    	   hs.setWid(rs.getString("wid"));
    	   hs.setChangeName(rs.getString("changename"));
    	   hs.setFileName(rs.getString("oriname"));
    	   hs.setOriName(rs.getString("oriname"));
    	   hs.setFileType(rs.getString("filetype"));
          /* hs.setId(rs.getString("id"));
           hs.setType(rs.getString("type"));
           hs.setLocation(rs.getString("localtion"));
           hs.setDestription(rs.getString("description"));
           hs.setLeaseStatus(rs.getInt("lease_status"));
           hs.setArea(rs.getFloat("AREA"));
           hs.setTitle(rs.getString("title"));
           hs.setRental(rs.getFloat("rental"));
           hs.setLeaseTrem(Integer.parseInt(rs.getString("lease_term")));*/
           return hs;
       }
   }

	@Override
	public void saveFilesWithHouseId(String rId, String filesId) {
		String sql = "UPDATE filesinfo SET roominfoid = ? WHERE wid IN(?)";
		this.jdbcTemplate.update(sql, new Object[]{rId,filesId} );
	}
}
