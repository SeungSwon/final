package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Resignation {
	private String aId;
	private String rTitle;
	private String rPhone;
	private String rReason;
	private String consignee;
	private String interview;
	private Date expectDate;
	private String interviewee;
	
	public Resignation() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public String getrReason() {
		return rReason;
	}

	public void setrReason(String rReason) {
		this.rReason = rReason;
	}

	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getInterview() {
		return interview;
	}

	public void setInterview(String interview) {
		this.interview = interview;
	}

	public Date getExpectDate() {
		return expectDate;
	}

	public void setExpectDate(Date expectDate) {
		this.expectDate = expectDate;
	}

	public String getInterviewee() {
		return interviewee;
	}

	public void setInterviewee(String interviewee) {
		this.interviewee = interviewee;
	}

	@Override
	public String toString() {
		return "Resignation [aId=" + aId + ", rTitle=" + rTitle + ", rPhone=" + rPhone + ", rReason=" + rReason
				+ ", consignee=" + consignee + ", interview=" + interview + ", expectDate=" + expectDate
				+ ", interviewee=" + interviewee + "]";
	}
	
}
