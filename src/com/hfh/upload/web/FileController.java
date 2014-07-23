package com.hfh.upload.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.doomdark.uuid.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hfh.bean.FileMeta;
import com.hfh.upload.service.UploadService;
import com.hfh.util.PathUtils;

@Controller
@RequestMapping("/management")
public class FileController {

	@Autowired
    UploadService uploadService;
	
	@Autowired
	PathUtils pu;
	
	/***************************************************
	 * URL: /rest/controller/upload  
	 * upload(): receives files
	 * @param request : MultipartHttpServletRequest auto passed
	 * @param response : HttpServletResponse auto passed
	 * @return LinkedList<FileMeta> as json format
	 ****************************************************/
	@RequestMapping(value="/upload", method = RequestMethod.POST)
    @ResponseBody
	public LinkedList<FileMeta> upload(@RequestParam("rId") String rId,MultipartHttpServletRequest
               request, HttpServletResponse response) {
		LinkedList<FileMeta> files = new LinkedList<FileMeta>();
		FileMeta fileMeta = null;
		System.out.println(request.getParameter("id"));
		 Iterator<String> itr =  request.getFileNames();
		 MultipartFile mpf = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //2. get each file
		 while(itr.hasNext()){
             String uuid =  UUIDGenerator.getInstance().generateTimeBasedUUID().toString();
			 //2.1 get next MultipartFile
			 mpf = request.getFile(itr.next()); 
			 System.out.println(mpf.getOriginalFilename() +" uploaded! "+files.size());
			 String [] t = (mpf.getOriginalFilename()).split("\\.");
			 StringBuilder sb = new StringBuilder("");
			// sb
			 request.getSession().getServletContext().getRealPath("");
             String changeName = (sb.append(sdf.format(new Date())).append("_").append(uuid)
            		 .append(".").append(t[1])).toString();
            	// sdf.format(new Date())+"_"+uuid;

			 //2.2 if files > 10 remove the first from the list
			 if(files.size() >= 10)
				 files.pop();
			 
			 //2.3 create new fileMeta
			 fileMeta = new FileMeta();
             fileMeta.setWid(uuid);
             fileMeta.setOriName(mpf.getOriginalFilename());
             fileMeta.setChangeName(changeName);
			 fileMeta.setFileName(mpf.getOriginalFilename());
			 fileMeta.setFileSize(mpf.getSize()/1024+" Kb");
			 fileMeta.setFileType(mpf.getContentType());
			 fileMeta.setRoomInfoId(rId);
            // fileMeta.setRoomInfoId(rId);
			 System.out.println(pu.getUploadPath());
			 try {
				fileMeta.setBytes(mpf.getBytes());
				// copy file to local disk (make sure the path "e.g. D:/temp/files" exists)
				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(pu.getUploadPath()+changeName));
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			 //2.4 add to files
             uploadService.saveFiles(fileMeta);
			 files.add(fileMeta);
			 
		 }
		return files;
 
	}


	/***************************************************
	 * URL: /rest/controller/get/{value}
	 * get(): get file as an attachment
	 * @param response : passed by the server
	 * @param value : value from the URL
	 * @return void
	 ****************************************************/
	@RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
	 public void get(HttpServletResponse response,@PathVariable String value){
		LinkedList<FileMeta> files = new LinkedList<FileMeta>();
		 FileMeta getFile = files.get(Integer.parseInt(value));
		 try {		
			 	response.setContentType(getFile.getFileType());
			 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getFileName()+"\"");
		        FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
		 }catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }
	 }
	
    /***************************************************
     * URL: /rest/controller/get/{value}
     * get(): get file as an attachment
     * @param  : passed by the server
     * @param  : value from the URL
     * @return void
     ****************************************************/
	 /*@RequestMapping("/upload")
    @ResponseBody
    public Map<String ,List<FileMeta>> getw(){
        Map<String ,List<FileMeta>> r = new HashMap<String ,List<FileMeta>>();
        List<FileMeta> res = uploadService.getFilesByRoomInfoId("aaa");
        r.put("files", res);
        return r;
    }*/
   
	 @RequestMapping(value = "/upload", method = RequestMethod.GET)
	    public String getw(){
	        Map<String ,List<FileMeta>> r = new HashMap<String ,List<FileMeta>>();
	        List<FileMeta> res = uploadService.getFilesByRoomInfoId("aaa");
	        r.put("files", res);
	        return "management/upload9";
	    }
    
    @RequestMapping(value="/removeFile",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deletefiles(@RequestParam("rId") String rId,
    		@RequestParam("id") String id,@RequestParam("cname") String cname){
    	Map<String,String> r = new HashMap<String,String>();
    	boolean t = uploadService.deleteFile( rId,id,cname);
    	if(t){
    		r.put("result", "success");
    	}else{
    		r.put("result", "failer");
    	}
    	return r;
    }
    
    @RequestMapping(value="/saveFileInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> setFilesWithHoueId(@RequestParam("rId") String rId,
    		@RequestParam("fileIds") String fIds){
    	Map<String,String> r = new HashMap<String,String>();
    	uploadService.saveFilesWithHouseId( rId,fIds);
    	/*if(t){
    		
    	}else{
    		r.put("result", "failer");
    	}*/
    	r.put("result", "success");
    	return r;
    }
    
}
