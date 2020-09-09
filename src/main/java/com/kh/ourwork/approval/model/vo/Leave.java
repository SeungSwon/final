package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Leave {
	private String aId;
	private Date leStartDate;
	private Date leEndDate;
	private Date leReDate;
	private String leContent;
	private String proxy;
	private String handover;
	private String lePhone;
	private int lLevel;
	
	public Leave() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public Date getLeStartDate() {
		return leStartDate;
	}

	public void setLeStartDate(Date leStartDate) {
		this.leStartDate = leStartDate;
	}

	public Date getLeEndDate() {
		return leEndDate;
	}

	public void setLeEndDate(Date leEndDate) {
		this.leEndDate = leEndDate;
	}

	public Date getLeReDate() {
		return leReDate;
	}

	public void setLeReDate(Date leReDate) {
		this.leReDate = leReDate;
	}

	public String getLeContent() {
		return leContent;
	}

	public void setLeContent(String leContent) {
		this.leContent = leContent;
	}

	public String getProxy() {
		return proxy;
	}

	public void setProxy(String proxy) {
		this.proxy = proxy;
	}

	public String getHandover() {
		return handover;
	}

	public void setHandover(String handover) {
		this.handover = handover;
	}

	public String getLePhone() {
		return lePhone;
	}

	public void setLePhone(String lePhone) {
		this.lePhone = lePhone;
	}
	
	public int getlLevel() {
		return lLevel;
	}

	public void setlLevel(int lLevel) {
		this.lLevel = lLevel;
	}

	@Override
	public String toString() {
		return "Leave [aId=" + aId + ", leStartDate=" + leStartDate + ", leEndDate=" + leEndDate + ", leReDate="
				+ leReDate + ", leContent=" + leContent + ", proxy=" + proxy + ", handover=" + handover + ", lePhone="
				+ lePhone + ", lLevel=" + lLevel + "]";
	}

	
}
