package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Approval {
	private String aId;
	private String eId;
	private String aName;
	private String aTitle;
	private String aStatus;	//I:진행  Y:완료  N:반려
	private Date astartDate;
	private Date aendDate;
	private String eName;
	private String dName;
	
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

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public Date getAstartDate() {
		return astartDate;
	}

	public void setAstartDate(Date astartDate) {
		this.astartDate = astartDate;
	}

	public Date getAendDate() {
		return aendDate;
	}

	public void setAendDate(Date aendDate) {
		this.aendDate = aendDate;
	}
	
	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	@Override
	public String toString() {
		return "Approval [aId=" + aId + ", eId=" + eId + ", aName=" + aName + ", aTitle=" + aTitle + ", aStatus="
				+ aStatus + ", astartDate=" + astartDate + ", aendDate=" + aendDate + ", eName=" + eName + ", dName="
				+ dName + "]";
	}

}
