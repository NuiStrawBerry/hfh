package com.hfh.management.comments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yzYang on 2014/12/13.
 */
@Service
public class CommentsServiceImpl implements CommentsService{

    @Autowired
    private CommentsDao cDao;

    @Override
    public List<CusComment> getCommentsList() {
        cDao.getCommentsList();
        return null;
    }
}
