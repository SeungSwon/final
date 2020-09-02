package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class LineAttachment {
	private int fId;			// 첨부파일 식별번호	
	private String filePath;	// 파일경로
	private String originName;	// 업로드명
	private String changeName;	// 변경명
	private Date fUploadDate;	// 업로드일
	private int fileLevel;		// 참조구분
	private String fStatus;		//파일상태
	private int lineId;			//결재선 주식별자
	
	public LineAttachment() {}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getfUploadDate() {
		return fUploadDate;
	}

	public void setfUploadDate(Date fUploadDate) {
		this.fUploadDate = fUploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public int getLineId() {
		return lineId;
	}

	public void setLineId(int lineId) {
		this.lineId = lineId;
	}

	@Override
	public String toString() {
		return "LineAttachment [fId=" + fId + ", filePath=" + filePath + ", originName=" + originName + ", changeName="
				+ changeName + ", fUploadDate=" + fUploadDate + ", fileLevel=" + fileLevel + ", fStatus=" + fStatus
				+ ", lineId=" + lineId + "]";
	}

}
