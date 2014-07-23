package com.hfh.upload.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hfh.bean.FileMeta;
import com.hfh.upload.service.UploadService;

@Controller
public class ImageDownoadController {
	 	private static final String HEADER_EXPIRES = "Expires";

	    private static final String HEADER_CACHE_CONTROL = "Cache-Control";

	    private static String MICRO_PHOTO_FILE_POSTFIX = "jpeg";

	    private int microphotoWidth = 120;

	    private int microphotoHeight = 120;

//	    protected AttachmentManager attachmentManager;

	    private int attachmentCacheSeconds = 60 * 60 * 24;
	    LinkedList<FileMeta> files = new LinkedList<FileMeta>();
	    @Autowired
	    UploadService uploadService;
	
	public void download(HttpServletRequest request,HttpServletResponse response,@PathVariable String value){
	     /*String attachmentId = request.getParameter("attachmentId");
	        String ownerId = request.getParameter("ownerId");
	        String type = request.getParameter("type");

	        Attachment attachment = null;
	        if (attachmentId == null || "".equals(attachmentId.trim())) {
	            if (ownerId == null || "".equals(ownerId.trim()) || type == null || "".equals(type.trim()))
	                throw new IllegalArgumentException("Can not find proper attachmentId or ownerId and type parameter.");
	            List attachments = attachmentManager.getAttachments(ownerId, type);
	            if (attachments.size() != 0) {
	                attachment = (Attachment) attachments.get(0);
	            }
	        } else {
	            attachment = attachmentManager.getAttachment(attachmentId);
	        }

	        if (attachment == null) {
	            processNoAttachmentOrFileNotExist(request, response, type);
	            return null;
	        }
	        Date modified = attachment.getCreateTime();
	        long modifiedSince = request.getDateHeader("If-Modified-Since");
	        if (modifiedSince > 0L) {
	            // round the date to the ignore millisecond value which is not supplied by header
	            long modDate = (modified.getTime() / 1000L) * 1000L;
	            if (modDate <= modifiedSince) {
	                response.setStatus(304);
	                return null;
	            }
	        }
	        response.setDateHeader("Last-Modified", modified.getTime());

	        if (request.getParameter("notUseCache") == null) {
	            // HTTP 1.0 header
	            response.setDateHeader(HEADER_EXPIRES, System.currentTimeMillis() + attachmentCacheSeconds * 1000L);
	            // HTTP 1.1 header
	            String headerValue = "max-age=" + attachmentCacheSeconds;
	            response.setHeader(HEADER_CACHE_CONTROL, headerValue);
	        }
	            AttachmentConfig config = attachmentManager.getAttachmentConfig(attachment.getAttachType());
	        if (config == null) {
	            processNoAttachmentOrFileNotExist(request, response, null);
	            return null;
	        }
	        AttachmentSecurityManager securityManager = config.getSecurityManager();
	        if (securityManager != null) {
	            if (!securityManager.hasPermission(AuthContextHolder.getAuthContext().getUser(), attachment)) {
	                processAttachmentAccessDenied(request, response, null);
	                return null;
	            }
	        }
	        File file = new File(attachmentManager.getRootStorePath() + System.getProperty("file.separator") + config.getSavePath() + System.getProperty("file.separator") + attachment.getSaveName());
	        if (!file.exists()) {
	            processNoAttachmentOrFileNotExist(request, response, attachment.getAttachType());
	            return null;
	        } else {
	            String microPhoto = request.getParameter("microPhoto");
	            if (microPhoto != null) {
	                createMicroFile(request, response, new BufferedInputStream(new FileInputStream(file)));
	            } else {
	                String contentType = attachment.getContentType();
	                String fileName = attachment.getFileName();
	                if (contentType != null)
	                    response.setContentType(contentType);
	                response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("gb2312"), "iso8859-1") + "\"");
	                FileCopyUtils.copy(new BufferedInputStream(new FileInputStream(file)), new BufferedOutputStream(response.getOutputStream()));
	            }
	            return null;
	        }*/
	}
	
	@RequestMapping(value = "/d", method = RequestMethod.GET)
	public void d(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		File f = null;
		if("noimage".equals(id)){
			f = new File("D:\\temp\\files\\community_image.png");
			 try {		
//				 	response.setContentType(getFile.getFileType());
//				 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getChangeName()+"\"");
			       // FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
			        FileCopyUtils.copy(new BufferedInputStream(new FileInputStream(f)), new BufferedOutputStream(response.getOutputStream()));
			 }catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			 }
		}else{
			FileMeta getFile = uploadService.getFileById(id);
			f = new File("D:\\temp\\files\\"+getFile.getChangeName());
			 try {		
				 	response.setContentType(getFile.getFileType());
				 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getChangeName()+"\"");
			       // FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
			        FileCopyUtils.copy(new BufferedInputStream(new FileInputStream(f)), new BufferedOutputStream(response.getOutputStream()));
			 }catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			 }
		}
		
		/*System.out.println(f.exists());
		System.out.println(f.isDirectory());*/
		//D:\temp\files
		
/*		 try {		
			 	response.setContentType(getFile.getFileType());
			 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getChangeName()+"\"");
		       // FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
		        FileCopyUtils.copy(new BufferedInputStream(new FileInputStream(f)), new BufferedOutputStream(response.getOutputStream()));
		 }catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		 }*/
	}

}
