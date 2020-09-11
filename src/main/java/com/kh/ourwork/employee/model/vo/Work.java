package com.kh.ourwork.employee.model.vo;

public class Work {
	private int wId;
	private String wIn;
	private String wOut;
	private String eId;
	
	public Work() {}
	
	public Work(int wId, String wIn, String wOut, String eId) {
		super();
		this.wId = wId;
		this.wIn = wIn;
		this.wOut = wOut;
		this.eId = eId;

	}


	public int getwId() {
		return wId;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public String getwIn() {
		return wIn;
	}

	public void setwIn(String wIn) {
		this.wIn = wIn;
	}

	public String getwOut() {
		return wOut;
	}

	public void setwOut(String wOut) {
		this.wOut = wOut;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	@Override
	public String toString() {
		return "Work [wId=" + wId + ", wIn=" + wIn + ", wOut=" + wOut + ", eId=" + eId + "]";
	}


}