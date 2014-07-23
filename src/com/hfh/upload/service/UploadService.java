package com.hfh.upload.service;

import com.hfh.bean.FileMeta;

import java.util.List;

/**
 * Created by yzYang on 14-2-17.
 */
public interface UploadService {

    boolean saveFiles(FileMeta fm);
    List<FileMeta> getFilesByRoomInfoId(String roomInfoId);
    boolean deleteFile(String rId,String id);
    boolean deleteFile(String rId,String id,String cnmae);
    FileMeta getFileById(String id);
    void saveFilesWithHouseId(String rId,String filesId);

}
