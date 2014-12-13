package com.hfh.management.comments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yzYang on 2014/12/13.
 */
@Service
public class CommentsDaoImpl implements CommentsDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<CusComment> getCommentsList() {
        String sql = "SELECT * FROM t_cuscomments ORDER BY cdatetime DESC;";
        List<CusComment> acs = jdbcTemplate.query(sql,new CusCommentRowMapper());
        return acs;
    }
}
