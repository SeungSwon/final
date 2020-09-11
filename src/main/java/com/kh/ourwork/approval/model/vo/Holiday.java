package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Holiday {
	private String aId;
	private String hdType;
	private int hterm;
	private Date hstartDate;
	private Date hendDate;
	private String hReason;
	
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getHdType() {
		return hdType;
	}
	public void setHdType(String hdType) {
		this.hdType = hdType;
	}
	public Date getHstartDate() {
		return hstartDate;
	}
	public void setHstartDate(Date hstartDate) {
		this.hstartDate = hstartDate;
	}
	public Date getHendDate() {
		return hendDate;
	}
	public void setHendDate(Date hendDate) {
		this.hendDate = hendDate;
	}
	public int getHterm() {
		return hterm;
	}
	public void setHterm(int hterm) {
		this.hterm = hterm;
	}
	public String gethReason() {
		return hReason;
	}
	public void sethReason(String hReason) {
		this.hReason = hReason;
	}
	@Override
	public String toString() {
		return "Holiday [aId=" + aId + ", hdType=" + hdType + ", hterm=" + hterm + ", hstartDate=" + hstartDate
				+ ", hendDate=" + hendDate + ", hReason=" + hReason + "]";
	}
	
}
