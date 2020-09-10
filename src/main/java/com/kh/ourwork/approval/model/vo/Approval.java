package com.kh.ourwork.approval.model.vo;

import java.util.Date;

public class Approval {
	private String aId;
	private String eId;
	private String aName;
	private String aTitle;
	private String aContent;
	private String aStatus;	//I:진행  Y:완료  N:반려
	private Date startDate;
	private Date endDate;
	
	public Approval() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Approval [aId=" + aId + ", eId=" + eId + ", aName=" + aName + ", aTitle=" + aTitle + ", aContent="
				+ aContent + ", aStatus=" + aStatus + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
}
