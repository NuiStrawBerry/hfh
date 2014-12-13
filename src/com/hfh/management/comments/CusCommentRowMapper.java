package com.hfh.management.comments;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by yzYang on 2014/12/13.
 */
public class CusCommentRowMapper implements RowMapper<CusComment> {


    public CusComment mapRow(ResultSet rs, int rowNum) throws SQLException {
        CusComment cc = new CusComment();
        cc.setId(rs.getString("id"));
        cc.setContent(rs.getString("cuscontent"));
        cc.setCusName(rs.getString("cusname"));
        cc.setDate(rs.getString("datetime"));
        return cc;
    }

}
