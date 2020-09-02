package com.kh.ourwork.approval.model.vo;

public class LineList {
	private String eId;
	private String eName;
	private String rName; //직급이름	
	private String dName; //부서이름
	private int rNum;
	
	public LineList() {}

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

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "LineList [eId=" + eId + ", eName=" + eName + ", rName=" + rName + ", dName=" + dName + ", rNum=" + rNum
				+ "]";
	}
		
}
