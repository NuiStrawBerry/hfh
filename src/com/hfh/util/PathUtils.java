package com.hfh.util;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.io.File;
@Service
public class PathUtils {
	
//	private final boolean osName = System.getProperty("os.name")
//	private String path = "";
	
	final String path="F:\\java plugin\\apache-tomcat-6.0.36\\wtpwebapps\\hfh\\timgs\\"; 
//	final String path = "/opt/tomcat7/webapps/ROOT/timgs/";
	public String getUploadPath(){
		String separator = System.getProperty("file.separator");
    	StringBuilder sb = new StringBuilder(System.getProperty("user.dir"));
    	sb.append(separator).append("timgs").append(separator);
    	File f = new File(sb.toString());
    	if(!f.exists()){
    		f.mkdirs();
    	}
    	return getPath();
	}
	
	
	public String getOsName(){
		
		return System.getProperty("os.name");
	}
	
	public String getPath(){
		 String path = "/opt/tomcat7/webapps/ROOT/timgs/";
		if(StringUtils.isNotBlank(getOsName()) && getOsName().startsWith("Windows")){
			path = "F:\\java plugin\\apache-tomcat-6.0.36\\wtpwebapps\\hfh\\timgs\\";
		}
		return path;
	}
	

}
