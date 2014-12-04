package com.hfh.management.houseinfo.service.impl;

import com.hfh.bean.FileMeta;
import com.hfh.bean.HouseInfo;
import com.hfh.management.houseinfo.dao.HouseInfoDao;
import com.hfh.management.houseinfo.service.HouseManager;
import com.hfh.upload.dao.UploadDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseManagerImpl implements HouseManager {

	private final Logger logger = Logger.getLogger(HouseManagerImpl.class);
	@Autowired
	private HouseInfoDao houseDao;
	@Autowired
    private UploadDao uploadDao;
	@Override
	public void addHouseInfo(HouseInfo houseInfo) {
		houseDao.addHouseInfo(houseInfo);
	}

    public List<HouseInfo> getHouseInfos(){
        return houseDao.getHouseInfoList();
    }
    
	/**
	 * 待改进
	 */
    public List<HouseInfo> getTopHouseInfos(){
    	List<HouseInfo> hi = houseDao.getTopHouseInfoList();
    	if(hi.size()>0){
    		for(HouseInfo thi:hi ){
    			List<FileMeta> images = uploadDao.getFilesByRoomInfoId(thi.getId());
    			thi.setImages(images);
    		}
    	}
        return hi;
    }

	/**
	 * 待改进
	 */
    public List<HouseInfo> getTopHouseInfoList(String type,int pageSize,int limit){
    	List<HouseInfo> hi = houseDao.getTopHouseInfoList(type,pageSize,limit);
    	if(hi.size()>0){
    		for(HouseInfo thi:hi ){
    			List<FileMeta> images = uploadDao.getFilesByRoomInfoId(thi.getId());
    			thi.setImages(images);
    			if(images.size()>0)
    			thi.setImagesName(((FileMeta)images.get(0)).getChangeName());
    		}
    	}
        return hi;
    }

    
	@Override
	public boolean changeStatus(String rId,String p,String value) {
		
		 p = p.equals("hot")?"ishot":p.equals("top")?"istopshow":"lease_status";
		return houseDao.changeStatus(rId, p, value);
	}

	@Override
	public void deleteHouseInfoById(String id) {
        houseDao.deleteHouseInfoById(id);

	}

	@Override
	public void deleteHouseInfos() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateHouseInfo(HouseInfo hi) {
		houseDao.updateHouseInfo(hi);
	}

	public void save(HouseInfo hi){
		logger.info(houseDao.isExit(hi.getId()));
		logger.debug(houseDao.isExit(hi.getId()));
		if(houseDao.isExit(hi.getId())){
			houseDao.updateHouseInfo(hi);
		}else{
			houseDao.addHouseInfo(hi);
		}
	}
   public HouseInfo getHouseInfo(String id){
       HouseInfo houseInfo =  houseDao.getHouseInfoById(id);
       List<FileMeta> images = uploadDao.getFilesByRoomInfoId(houseInfo.getId());
       houseInfo.setImages(images);
       return  houseInfo;
    }

	@Override
	public List<HouseInfo> getHouseInfoByConditions(String keyWords, String type,
			String location, String bedrooms, String minRetal, String maxRetal,
			String minFloorSize, String maxFloorSize) {
		
		 return houseDao.getHouseInfoByConditions(keyWords,type, location,bedrooms,minRetal,maxRetal,minFloorSize, maxFloorSize);
	}

	@Override
	public List<HouseInfo> getHouseInfoByType(String type) {
		List<HouseInfo> hi = houseDao.getHouseInfoByConditions("",type, "","","","","", "");
		 if(hi.size()>0){
	    		for(HouseInfo thi:hi ){
	    			List<FileMeta> images = uploadDao.getFilesByRoomInfoId(thi.getId());
	    			thi.setImages(images);
	    			if(images.size()>0)
	    			thi.setImagesName(((FileMeta)images.get(0)).getChangeName());
	    		}
	    	}
		 return hi;
	}

	@Override
	public List<HouseInfo> topflowInfo() {
		List<HouseInfo> hi = houseDao.topflowInfo();
		 if(hi.size()>0){
	    		for(HouseInfo thi:hi ){
	    			List<FileMeta> images = uploadDao.getFilesByRoomInfoId(thi.getId());
	    			thi.setImages(images);
	    			if(images.size()>0)
	    			thi.setImagesName(((FileMeta)images.get(0)).getChangeName());
	    		}
	    	}
		 return hi;
	}
	
	public List<HouseInfo> popularHouse(){
		List<HouseInfo> hi = houseDao.popularHouse();
		return hi;
	}

}
