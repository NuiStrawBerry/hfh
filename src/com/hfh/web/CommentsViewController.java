package com.hfh.web;

import com.hfh.management.comments.CommentsService;
import com.hfh.management.comments.CusComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by yzYang on 14-2-18.
 */
@Controller
public class CommentsViewController {

    @Autowired
    private CommentsService commentsService;

    @RequestMapping(value="/ccomments",method = RequestMethod.POST)
    @ResponseBody
    public List<CusComment> indexPage(@RequestParam(value="p",required = false) String id,
                            @RequestParam(value="showDetail",required = false) String isShowDetail,
                            Model model){
        List<CusComment> cComments = commentsService.getCommentsList();
        return cComments;
    }
}
