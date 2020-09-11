package com.kh.ourwork.pteam.model.vo;

public class Rank {
	private int rId; //직급 번호
	private String rName;// 직급 이름
	
	public Rank() {}

	public Rank(int rId, String rName) {
		super();
		this.rId = rId;
		this.rName = rName;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	@Override
	public String toString() {
		return "Rank [rId=" + rId + ", rName=" + rName + "]";
	}
	
	
}
