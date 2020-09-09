package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Expenditurecc {
	private String aId;
	private String eMatters;
	private Date eDate;
	private String ePlace;
	private Date eStartDate;
	private Date eEndDate;
	private String expenditure;
	private String account;
	
	public Expenditurecc() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String geteMatters() {
		return eMatters;
	}

	public void seteMatters(String eMatters) {
		this.eMatters = eMatters;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public String getePlace() {
		return ePlace;
	}

	public void setePlace(String ePlace) {
		this.ePlace = ePlace;
	}

	public Date geteStartDate() {
		return eStartDate;
	}

	public void seteStartDate(Date eStartDate) {
		this.eStartDate = eStartDate;
	}

	public Date geteEndDate() {
		return eEndDate;
	}

	public void seteEndDate(Date eEndDate) {
		this.eEndDate = eEndDate;
	}

	public String getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(String expenditure) {
		this.expenditure = expenditure;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "Expenditurecc [aId=" + aId + ", eMatters=" + eMatters + ", eDate=" + eDate + ", ePlace=" + ePlace
				+ ", eStartDate=" + eStartDate + ", eEndDate=" + eEndDate + ", expenditure=" + expenditure
				+ ", account=" + account + "]";
	}
	
}
