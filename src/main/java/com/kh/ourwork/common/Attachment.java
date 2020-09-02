package com.kh.ourwork.common;

import java.util.Date;

public class Attachment {
	private int fId; // 첨부파일 식별번호
	private int mId; // 메일
	private int nNo; // 게시판
	private int cId; // 거래처
	private String aId; // 결재
	private int sbId; // SNS게시글
	private String eId; // 직원ID
	private int gId; // SNS 그룹
	private String filePath; // 파일경로
	private String originName; // 업로드명
	private String changeName; // 변경명
	private Date fUploadDate; // 업로드일
	private int fileLevel; // 참조구분

	/*
	 * 10. 직원 프로필사진 20. 직원 자격증 첨부파일 30. 메일 첨부파일 40. 결재 첨부파일 50. 거래처 사업자등록증 사진 60.
	 * 게시판 첨부파일 70. SNS그룹 대표사진
	 */

	private String fStatus; // 상태

	public Attachment() {
	}

	public Attachment(int fId, int mId, int nNo, int cId, String aId, int sbId, String eId, int gId, String filePath,
			String originName, String changeName, Date fUploadDate, int fileLevel, String fStatus) {
		super();
		this.fId = fId;
		this.mId = mId;
		this.nNo = nNo;
		this.cId = cId;
		this.aId = aId;
		this.sbId = sbId;
		this.eId = eId;
		this.gId = gId;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.fUploadDate = fUploadDate;
		this.fileLevel = fileLevel;
		this.fStatus = fStatus;
	}

	public Attachment(String filePath, String originName, String changeName, Date fUploadDate, int fileLevel) {
		super();
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.fUploadDate = fUploadDate;
		this.fileLevel = fileLevel;
	}

	public Attachment(int cId, String filePath, String originName, String changeName) {
		super();
		this.cId = cId;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
	}

	public Attachment(int cId) {
		super();
		this.cId = cId;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public int getSbId() {
		return sbId;
	}

	public void setSbId(int sbId) {
		this.sbId = sbId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
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

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", mId=" + mId + ", nNo=" + nNo + ", cId=" + cId + ", aId=" + aId + ", sbId="
				+ sbId + ", eId=" + eId + ", gId=" + gId + ", filePath=" + filePath + ", originName=" + originName
				+ ", changeName=" + changeName + ", fUploadDate=" + fUploadDate + ", fileLevel=" + fileLevel
				+ ", fStatus=" + fStatus + "]";
	}

}
