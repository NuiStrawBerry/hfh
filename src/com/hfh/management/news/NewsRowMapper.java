package com.hfh.management.news;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hfh.bean.News;

public class NewsRowMapper  implements RowMapper<News>{
	@Override
	public News mapRow(ResultSet rs, int rowNum) throws SQLException {
		News news = new News();
		news.setId(rs.getString("id"));
		news.setTitle(rs.getString("title"));
		news.setContent(rs.getString("content"));
		news.setType(rs.getString("type"));
		news.setCreatime(rs.getString("creatime"));
		news.setStatus(rs.getString("status"));
		return news;
	}

}
