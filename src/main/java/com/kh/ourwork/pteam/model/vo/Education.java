package com.kh.ourwork.pteam.model.vo;

import java.sql.Date;

public class Education {	//학력
	private int edId;	//학력번호
	private String eId;	//아이디
	private String sName; //학교이름
	private Date admissonDate; //입학일
	private Date graduationDay; //졸업일
	private String sType;	// 학교 유형
	private String department; // 학과
	private int sdivision;	//고/대 구분
	
	public Education() {}

	public Education(int edId, String eId, String sName, Date admissonDate, Date graduationDay, String sType,
			String department, int sdivision) {
		super();
		this.edId = edId;
		this.eId = eId;
		this.sName = sName;
		this.admissonDate = admissonDate;
		this.graduationDay = graduationDay;
		this.sType = sType;
		this.department = department;
		this.sdivision = sdivision;
	}

	public int getEdId() {
		return edId;
	}

	public void setEdId(int edId) {
		this.edId = edId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Date getAdmissonDate() {
		return admissonDate;
	}

	public void setAdmissonDate(Date admissonDate) {
		this.admissonDate = admissonDate;
	}

	public Date getGraduationDay() {
		return graduationDay;
	}

	public void setGraduationDay(Date graduationDay) {
		this.graduationDay = graduationDay;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getSdivision() {
		return sdivision;
	}

	public void setSdivision(int sdivision) {
		this.sdivision = sdivision;
	}

	@Override
	public String toString() {
		return "Education [edId=" + edId + ", eId=" + eId + ", sName=" + sName + ", admissonDate=" + admissonDate
				+ ", graduationDay=" + graduationDay + ", sType=" + sType + ", department=" + department
				+ ", sdivision=" + sdivision + "]";
	}

	
	

}
