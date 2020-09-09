package com.kh.ourwork.client.model.vo;

import java.util.Date;


public class UpdateClient {
	private int ucId;
	private int clId;
	private String eId;
	private String reason;
	private Date modifyDate;
	
	public UpdateClient() {}

	public UpdateClient(int ucId, int clId, String eId, String reason, Date modifyDate) {
		super();
		this.ucId = ucId;
		this.clId = clId;
		this.eId = eId;
		this.reason = reason;
		this.modifyDate = modifyDate;
	}
	
	public UpdateClient(int clId, String eId, String reason) {
		super();
		this.clId = clId;
		this.eId = eId;
		this.reason = reason;
	}

	
	public int getUcId() {
		return ucId;
	}

	public void setUcId(int ucId) {
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
