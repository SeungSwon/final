package com.kh.ourwork.notice.model.vo;

import java.sql.Date;

public class Reply {
	private int nrId;
	private int nNo;
	private String nrWriter;
	private String nrContent;
	private Date nrCreateDate;
	private Date nrModifyDate;
	private String nrStatus;
	
	public Reply() {}

	public Reply(int nrId, int nNo, String nrWriter, String nrContent, Date nrCreateDate, Date nrModifyDate,
			String nrStatus) {
		super();
		this.nrId = nrId;
		this.nNo = nNo;
		this.nrWriter = nrWriter;
		this.nrContent = nrContent;
		this.nrCreateDate = nrCreateDate;
		this.nrModifyDate = nrModifyDate;
		this.nrStatus = nrStatus;
	}

	public int getNrId() {
		return nrId;
	}

	public void setNrId(int nrId) {
		this.nrId = nrId;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getNrWriter() {
		return nrWriter;
	}

	public void setNrWriter(String nrWriter) {
		this.nrWriter = nrWriter;
	}

	public String getNrContent() {
		return nrContent;
	}

	public void setNrContent(String nrContent) {
		this.nrContent = nrContent;
	}

	public Date getNrCreateDate() {
		return nrCreateDate;
	}

	public void setNrCreateDate(Date nrCreateDate) {
		this.nrCreateDate = nrCreateDate;
	}

	public Date getNrModifyDate() {
		return nrModifyDate;
	}

	public void setNrModifyDate(Date nrModifyDate) {
		this.nrModifyDate = nrModifyDate;
	}

	public String getNrStatus() {
		return nrStatus;
	}

	public void setNrStatus(String nrStatus) {
		this.nrStatus = nrStatus;
	}

	@Override
	public String toString() {
		return "Reply [nrId=" + nrId + ", nNo=" + nNo + ", nrWriter=" + nrWriter + ", nrContent=" + nrContent
				+ ", nrCreateDate=" + nrCreateDate + ", nrModifyDate=" + nrModifyDate + ", nrStatus=" + nrStatus + "]";
	}
	
	
}