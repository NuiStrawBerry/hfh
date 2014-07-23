package com.hfh.upload.service.impl;

import com.hfh.bean.FileMeta;
import com.hfh.management.houseinfo.dao.HouseInfoDao;
import com.hfh.upload.dao.UploadDao;
import com.hfh.upload.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yzYang on 14-2-17.
 */
@Service
public class UploadServiceImpl implements UploadService{
    @Autowired
    private UploadDao uploadDao;
    @Override
    public boolean saveFiles(FileMeta fm) {
        uploadDao.saveFiles(fm);
        return true;
    }

    public List<FileMeta> getFilesByRoomInfoId(String roomInfoId){


        return uploadDao.getFilesByRoomInfoId(roomInfoId);
    }
    
    public boolean deleteFile(String rId,String id,String cname){
    	boolean result = false;
    	result = uploadDao.deleteFile( rId, id,cname);
    	return result;
    }
    
    public FileMeta getFileById(String id){
    	
    	//uploadDao.getFileById(fm);
    	return uploadDao.getFileById(id);
    }

	@Override
	public boolean deleteFile(String rId, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void saveFilesWithHouseId(String rId, String filesId) {
		uploadDao.saveFilesWithHouseId( rId,  filesId);
	}
}
