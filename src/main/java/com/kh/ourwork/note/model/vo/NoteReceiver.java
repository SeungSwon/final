package com.kh.ourwork.note.model.vo;

public class NoteReceiver {
	private String eId;
	private String eName;
	private String dName;
	private String rName;
	private String status;
	
	public NoteReceiver() {}

	public NoteReceiver(String eId, String eName, String dName, String rName, String status) {
		super();
		this.eId = eId;
		this.eName = eName;
		this.dName = dName;
		this.rName = rName;
		this.status = status;
	}

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

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoteReceiver [eId=" + eId + ", eName=" + eName + ", dName=" + dName + ", rName=" + rName + ", status="
				+ status + "]";
	}

	
	
	
	
}
