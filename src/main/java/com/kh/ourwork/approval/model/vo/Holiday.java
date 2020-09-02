package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Holiday {
	private String hdType;
	private Date startDate;
	private Date endDate;
	private int remain;
	private String hReason;
	public String getHdType() {
		return hdType;
	}
	public void setHdType(String hdType) {
		this.hdType = hdType;
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
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public String gethReason() {
		return hReason;
	}
	public void sethReason(String hReason) {
		this.hReason = hReason;
	}
	@Override
	public String toString() {
		return "Holiday [hdType=" + hdType + ", startDate=" + startDate + ", endDate=" + endDate + ", remain=" + remain
				+ ", hReason=" + hReason + "]";
	}

}
