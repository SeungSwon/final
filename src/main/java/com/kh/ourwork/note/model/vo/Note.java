package com.kh.ourwork.note.model.vo;

import java.util.Date;

public class Note {
	private int ntId;
	private String eId;
	private String ntContent;
	private Date ntDate;
	private String status;
	private String receiver;
	private Date receiveDate;
	private String recDel;		// 받은 사람이 삭제했는지 여부
	private String sentDel;		// 보낸 사람이 삭제했는지 여부
	
	public Note() {}

	public Note(int ntId, String eId, String ntContent, Date ntDate, String status, String receiver, Date receiveDate,
			String recDel, String sentDel) {
		super();
		this.ntId = ntId;
		this.eId = eId;
		this.ntContent = ntContent;
		this.ntDate = ntDate;
		this.status = status;
		this.receiver = receiver;
		this.receiveDate = receiveDate;
		this.recDel = recDel;
		this.sentDel = sentDel;
	}
	
	public Note(String eId, String ntContent, String receiver) {
		super();
		this.eId = eId;
		this.ntContent = ntContent;
		this.receiver = receiver;
	}

	public int getNtId() {
		return ntId;
	}

	public void setNtId(int ntId) {
		this.ntId = ntId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getNtContent() {
		return ntContent;
	}

	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}

	public Date getNtDate() {
		return ntDate;
	}

	public void setNtDate(Date ntDate) {
		this.ntDate = ntDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getRecDel() {
		return recDel;
	}

	public void setRecDel(String recDel) {
		this.recDel = recDel;
	}

	public String getSentDel() {
		return sentDel;
	}

	public void setSentDel(String sentDel) {
		this.sentDel = sentDel;
	}

	@Override
	public String toString() {
		return "Note [ntId=" + ntId + ", eId=" + eId + ", ntContent=" + ntContent + ", ntDate=" + ntDate + ", status="
				+ status + ", receiver=" + receiver + ", receiveDate=" + receiveDate + ", recDel=" + recDel
				+ ", sentDel=" + sentDel + "]";
	}
	
	
	
}
