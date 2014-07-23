package com.hfh.upload.dao;

import com.hfh.bean.FileMeta;

import java.io.File;
import java.util.List;

/**
 * Created by yzYang on 14-2-17.
 */
public interface UploadDao {
    boolean saveFiles(FileMeta fm);
    boolean deleteFiles(FileMeta fm);
    List<FileMeta> getFiles(String id);
    FileMeta getFileById(String fm);
    List<FileMeta> getFilesByRoomInfoId(String roomInfoId);
    boolean deleteFile(String rId,String id,String cname);
    void saveFilesWithHouseId(String rId, String filesId);
}
