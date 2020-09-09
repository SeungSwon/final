package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Spending {
	private String aId;
	private String sTitle;
	private String sAccount;
	private Date sDate;
	private String sReason;
	private String sExtend;
	private String sAll;
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsAccount() {
		return sAccount;
	}
	public void setsAccount(String sAccount) {
		this.sAccount = sAccount;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public String getsReason() {
		return sReason;
	}
	public void setsReason(String sReason) {
		this.sReason = sReason;
	}
	public String getsExtend() {
		return sExtend;
	}
	public void setsExtend(String sExtend) {
		this.sExtend = sExtend;
	}
	public String getsAll() {
		return sAll;
	}
	public void setsAll(String sAll) {
		this.sAll = sAll;
	}
	@Override
	public String toString() {
		return "Spending [aId=" + aId + ", sTitle=" + sTitle + ", sAccount=" + sAccount + ", sDate=" + sDate
				+ ", sReason=" + sReason + ", sExtend=" + sExtend + ", sAll=" + sAll + "]";
	}
	
}
