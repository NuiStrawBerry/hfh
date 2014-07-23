package com.hfh.bean;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties({"bytes"})
public class FileMeta implements Serializable {

	private static final long serialVersionUID = 7340553825368148116L;
	private byte[] bytes;
	private String changeName;
	private String fileName;

    private String fileSize;

    private String fileType;

    private String oriName;

    private String roomInfoId;

    private String wid;

    public byte[] getBytes() {
		return bytes;
	}

    public String getChangeName() {
        return changeName;
    }

    public String getFileName() {
		return fileName;
	}

    public String getFileSize() {
		return fileSize;
	}
    public String getFileType() {
		return fileType;
	}
    public String getOriName() {
        return oriName;
    }
    public String getRoomInfoId() {
        return roomInfoId;
    }
	
	public String getWid() {
        return wid;
    }
	
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}
	public void setChangeName(String changeName) {
        this.changeName = changeName;
    }
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public void setOriName(String oriName) {
        this.oriName = oriName;
    }
	public void setRoomInfoId(String roomInfoId) {
        this.roomInfoId = roomInfoId;
    }
	public void setWid(String wid) {
        this.wid = wid;
    }
}
