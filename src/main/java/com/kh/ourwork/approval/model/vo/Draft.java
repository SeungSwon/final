package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Draft {
	private String aId;
	private String dTitle;
	private Date effectiveDate;
	private String dContent;
	private int dLevel;
	
	public Draft() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public int getdLevel() {
		return dLevel;
	}

	public void setdLevel(int dLevel) {
		this.dLevel = dLevel;
	}

	@Override
	public String toString() {
		return "Draft [aId=" + aId + ", dTitle=" + dTitle + ", effectiveDate=" + effectiveDate + ", dContent="
				+ dContent + ", dLevel=" + dLevel + "]";
	}

	
	
}
