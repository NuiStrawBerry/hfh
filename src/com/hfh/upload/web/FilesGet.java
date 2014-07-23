package com.hfh.upload.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfh.bean.FileMeta;
import com.hfh.upload.service.UploadService;

@Controller
@RequestMapping("/management")
public class FilesGet {
	@Autowired
    UploadService uploadService;
	
	@RequestMapping(value="/getFiles", method = RequestMethod.POST)
	@ResponseBody
	 public  Map<String ,List<FileMeta>> getFiles(@RequestParam("rId") String rId) throws IOException{
		// FileMeta getFile = files.get(Integer.parseInt(value));
		 Map<String ,List<FileMeta>> r = new HashMap<String ,List<FileMeta>>();
	        List<FileMeta> res = uploadService.getFilesByRoomInfoId(rId);
	        System.out.println(new File("").getCanonicalPath());//获取标准的路径
		    System.out.println(new File("").getAbsolutePath());//获取绝对路径
	        r.put("files", res);
	        return r;
	 }
	
}
