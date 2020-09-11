package com.kh.ourwork.calendar.model.vo;

import java.util.Date;

public class Calendar {
	private int sId;
	private String eId;
	private int dId;
	private int sort;
	private String sName;
	private Date sDate;
	private Date fDate;
	private String place;
	private String memo;
	private String status;
	
	public Calendar() {}
	
	public Calendar(int sId, String eId, int dId, int sort, String sName, Date sDate, Date fDate, String place,
			String memo, String status) {
		super();
		this.sId = sId;
		this.eId = eId;
		this.dId = dId;
		this.sort = sort;
		this.sName = sName;
		this.sDate = sDate;
		this.fDate = fDate;
		this.place = place;
		this.memo = memo;
		this.status = status;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Calendar [sId=" + sId + ", eId=" + eId + ", dId=" + dId + ", sort=" + sort + ", sName=" + sName
				+ ", sDate=" + sDate + ", fDate=" + fDate + ", place=" + place + ", memo=" + memo + ", status=" + status
				+ "]";
	}
	
	
	
}
