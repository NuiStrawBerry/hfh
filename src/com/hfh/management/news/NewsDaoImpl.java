package com.hfh.management.news;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hfh.bean.News;


@Transactional
@Service
public class NewsDaoImpl implements NewsDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean addAndEditNews(final News news){
		
		String sql = "insert into t_news(title,content,type,status,creatime)values(?,?,?,?,now())";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement ps) throws SQLException {
            	ps.setString(1, news.getTitle());
            	ps.setString(2,news.getContent());
            	ps.setString(3,news.getType());
            	ps.setString(4,news.getStatus());
            }
        });
		return r>0?true:false;
	}
	
	public boolean updateNews(final News news){
		String sql = "update t_news set title = ?,content = ?,type=? ,status=? where id = ?";
		int r = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1, news.getTitle());
                preparedStatement.setString(2,news.getContent() );
                preparedStatement.setString(3,news.getType() );
                preparedStatement.setString(4,news.getStatus() );
                preparedStatement.setString(5,news.getId());
            }
        });
		return r>0?true:false;
	}
	
	public boolean deleteNews(String id){
		String sql = "delete from t_news where id = ?";
		int r = jdbcTemplate.update(sql,new Object[]{id});
		return r>0?true:false;
	}
	
	public boolean changeStatus(String id,String status){
		String sql = "update t_news set status = ? where id = ?";
		int r = jdbcTemplate.update(sql,new Object[]{status,id});
		return r>0?true:false;
	}
	
	public News getNews(String id){
		  String sql = "SELECT id,title,content,creatime,status,type FROM t_news where id = ?";
		  News news = jdbcTemplate.queryForObject(sql,new NewsRowMapper(),id);
		  return  news;
	}
	
	/**
	 * @see 
	 */
	public List<News> getAllNews(){
		
	 	String sql = "select * from t_news order by creatime desc";
        List<News> result =jdbcTemplate.query(sql, new NewsRowMapper()); 
        return result;
	}
	
	/**
	 * @see 
	 */
	public List<News> getNews(){
		String sql = "select * from t_news where status='1' order by creatime desc";
        List<News> result =jdbcTemplate.query(sql, new NewsRowMapper()); 
        return result;
	}
	
    public boolean isExit(String id ){
    	String sql = "select count(id) from t_news where id = ?";
    	
    	return jdbcTemplate.queryForObject(sql, Integer.class, id)>0?true:false;
    	// true;
    }

	
}
