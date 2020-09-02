package com.kh.ourwork.client.model.vo;

import java.sql.Date;

import lombok.Data;

public class updateClient {
	private String ucId;
	private int clId;
	private String eId;
	private String reason;
	private Date modifyDate;
	
	public updateClient() {}

	public updateClient(String ucId, int clId, String eId, String reason, Date modifyDate) {
		super();
		this.ucId = ucId;
		this.clId = clId;
		this.eId = eId;
		this.reason = reason;
		this.modifyDate = modifyDate;
	}
	
	public updateClient(int clId, String eId, String reason) {
		super();
		this.clId = clId;
		this.eId = eId;
		this.reason = reason;
	}

	public String getUcId() {
		return ucId;
	}

	public void setUcId(String ucId) {
		this.ucId = ucId;
	}

	public int getClId() {
		return clId;
	}

	public void setClId(int clId) {
		this.clId = clId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "updateClient [ucId=" + ucId + ", clId=" + clId + ", eId=" + eId + ", reason=" + reason + ", modifyDate="
				+ modifyDate + "]";
	}
	
	
}
