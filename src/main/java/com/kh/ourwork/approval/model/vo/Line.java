package com.kh.ourwork.approval.model.vo;

import java.util.Date;

public class Line {
	private int lineId;
	private String aId;
	private String eId;
	private String lStatus;
	private String lContent;
	private String lLevel;
	private Date lDate;

	public Line() {}

	public int getLineId() {
		return lineId;
	}

	public void setLineId(int lineId) {
		lineId = lineId;
	}

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

	public String getlLevel() {
		return lLevel;
	}

	public void setlLevel(String lLevel) {
		this.lLevel = lLevel;
	}

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	@Override
	public String toString() {
		return "Line [LineId=" + lineId + ", aId=" + aId + ", eId=" + eId + ", lStatus=" + lStatus + ", lContent="
				+ lContent + ", lLevel=" + lLevel + ", lDate=" + lDate + "]";
	}
	
}
