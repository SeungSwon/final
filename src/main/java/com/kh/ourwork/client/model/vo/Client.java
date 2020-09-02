package com.kh.ourwork.client.model.vo;

import java.sql.Date;

import lombok.Data;

public class Client {
	private int clId;
	private int cSort;			// 1-> 법인, 2-> 개인
	private String cName;	
	private String bNum;		// 사업자번호
	private String cAddress;
	private String represent;
	private String cPhone;
	private String fax;
	private String business;	// 업태
	private String manager;		// 담당자
	private String mDepartment;	// 담당자부서
	private String mPhone;
	private String mEmail;
	private Date createDate;	// 등록일
	private String status;
	
	public Client() {}

	public Client(int clId, int cSort, String cName, String bNum, String cAddress, String represent,
			String cPhone, String fax, String business, String manager, String mDepartment, String mPhone,
			String mEmail, Date createDate, String status) {
		super();
		this.clId = clId;
		this.cSort = cSort;
		this.cName = cName;
		this.bNum = bNum;
		this.cAddress = cAddress;
		this.represent = represent;
		this.cPhone = cPhone;
		this.fax = fax;
		this.business = business;
		this.manager = manager;
		this.mDepartment = mDepartment;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.createDate = createDate;
		this.status = status;
	}

	public int getClId() {
		return clId;
	}

	public void setClId(int clId) {
		this.clId = clId;
	}

	public int getcSort() {
		return cSort;
	}

	public void setcSort(int cSort) {
		this.cSort = cSort;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getbNum() {
		return bNum;
	}

	public void setbNum(String bNum) {
		this.bNum = bNum;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getmDepartment() {
		return mDepartment;
	}

	public void setmDepartment(String mDepartment) {
		this.mDepartment = mDepartment;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Client [clId=" + clId + ", cSort=" + cSort + ", cName=" + cName + ", bNum=" + bNum 
				+ ", cAddress=" + cAddress + ", represent=" + represent + ", cPhone=" + cPhone + ", fax=" + fax
				+ ", business=" + business + ", manager=" + manager + ", mDepartment=" + mDepartment + ", mPhone="
				+ mPhone + ", mEmail=" + mEmail + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	

	
	
}
