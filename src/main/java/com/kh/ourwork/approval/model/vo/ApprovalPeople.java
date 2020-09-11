package com.kh.ourwork.approval.model.vo;

public class ApprovalPeople {
	private String eId;
	private String eName;
	private String rName;
	private String dName;
	
	public ApprovalPeople() {}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
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
		return "ApprovalPeople [eId=" + eId + ", eName=" + eName + ", rName=" + rName + ", dName=" + dName + "]";
	}
	
	
}
