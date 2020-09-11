package com.kh.ourwork.approval.model.vo;

import java.util.Date;

public class Line {
	private int lineId;
	private String aId;
	private String leId;
	private String lStatus;
	private String lContent;
	private int lLevel;
	private Date lDate;
	private String eName;
	private String rName;
	private String dName;

	public Line() {}

	public int getLineId() {
		return lineId;
	}

	public void setLineId(int lineId) {
		this.lineId = lineId;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getLeId() {
		return leId;
	}

	public void setLeId(String leId) {
		this.leId = leId;
	}

	public String getlStatus() {
		return lStatus;
	}

	public void setlStatus(String lStatus) {
		this.lStatus = lStatus;
	}

	public String getlContent() {
		return lContent;
	}

	public void setlContent(String lContent) {
		this.lContent = lContent;
	}

	public int getlLevel() {
		return lLevel;
	}

	public void setlLevel(int lLevel) {
		this.lLevel = lLevel;
	}

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	@Override
	public String toString() {
		return "Line [lineId=" + lineId + ", aId=" + aId + ", leId=" + leId + ", lStatus=" + lStatus + ", lContent="
				+ lContent + ", lLevel=" + lLevel + ", lDate=" + lDate + ", eName=" + eName + ", rName=" + rName
				+ ", dName=" + dName + "]";
	}

	
	
}
