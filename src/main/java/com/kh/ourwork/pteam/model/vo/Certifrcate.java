package com.kh.ourwork.pteam.model.vo;

import java.sql.Date;

public class Certifrcate {
	private String lId;	//자격증 번호
	private String eId; // 아이디
	private String ce_Name;	//자격증명
	private String rating;	//등급
	private String agency;	//발급기관
	private Date issueDate; //발급날짜
	private Date exprationDate; // 만료기간
	
	public Certifrcate() {}

	public Certifrcate(String lId, String eId, String ce_Name, String rating, String agency, Date issueDate,
			Date exprationDate) {
		super();
		this.lId = lId;
		this.eId = eId;
		this.ce_Name = ce_Name;
		this.rating = rating;
		this.agency = agency;
		this.issueDate = issueDate;
		this.exprationDate = exprationDate;
	}

	public String getlId() {
		return lId;
	}

	public void setlId(String lId) {
		this.lId = lId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getCe_Name() {
		return ce_Name;
	}

	public void setCe_Name(String ce_Name) {
		this.ce_Name = ce_Name;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public Date getExprationDate() {
		return exprationDate;
	}

	public void setExprationDate(Date exprationDate) {
		this.exprationDate = exprationDate;
	}

	@Override
	public String toString() {
		return "Certifrcate [lId=" + lId + ", eId=" + eId + ", ce_Name=" + ce_Name + ", rating=" + rating + ", agency="
				+ agency + ", issueDate=" + issueDate + ", exprationDate=" + exprationDate + "]";
	}
	
	
}
