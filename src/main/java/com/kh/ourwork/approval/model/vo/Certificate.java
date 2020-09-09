package com.kh.ourwork.approval.model.vo;

public class Certificate {
	private String aId;
	private String cKind;
	private String cPurpose;
	private int cNum;
	private String cSubmission;
	private String cSelect;
	
	public Certificate() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getcKind() {
		return cKind;
	}

	public void setcKind(String cKind) {
		this.cKind = cKind;
	}

	public String getcPurpose() {
		return cPurpose;
	}

	public void setcPurpose(String cPurpose) {
		this.cPurpose = cPurpose;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getcSubmission() {
		return cSubmission;
	}

	public void setcSubmission(String cSubmission) {
		this.cSubmission = cSubmission;
	}

	public String getcSelect() {
		return cSelect;
	}

	public void setcSelect(String cSelect) {
		this.cSelect = cSelect;
	}

	@Override
	public String toString() {
		return "Certificate [aId=" + aId + ", cKind=" + cKind + ", cPurpose=" + cPurpose + ", cNum=" + cNum
				+ ", cSubmission=" + cSubmission + ", cSelect=" + cSelect + "]";
	}

	
}
