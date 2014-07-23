package com.hfh.util;

import java.io.File;

import org.springframework.stereotype.Service;
@Service
public class PathUtils {
	
	public String getUploadPath(){
		String separator = System.getProperty("file.separator");
    	StringBuilder sb = new StringBuilder(System.getProperty("user.dir"));
    	sb.append(separator).append("timgs").append(separator);
    	File f = new File(sb.toString());
    	if(!f.exists()){
    		f.mkdirs();
    	}
    	return sb.toString();
	}

}
