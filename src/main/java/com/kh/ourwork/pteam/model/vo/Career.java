package com.kh.ourwork.pteam.model.vo;

import java.sql.Date;

public class Career {
	private int cId;	//경력번호
	private String eId;	//아이디
	private String c_Department; //부서
	private String rank;	//직급
	private Date employmentDate; //입사일
	private Date resignation; //퇴사일
	private String rectal;	//직장이름;
	
	public Career() {}

	public Career(int cId, String eId, String c_Department, String rank, Date employmentDate, Date resignation,
			String rectal) {
		super();
		this.cId = cId;
		this.eId = eId;
		this.c_Department = c_Department;
		this.rank = rank;
		this.employmentDate = employmentDate;
		this.resignation = resignation;
		this.rectal = rectal;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getC_Department() {
		return c_Department;
	}

	public void setC_Department(String c_Department) {
		this.c_Department = c_Department;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Date getEmploymentDate() {
		return employmentDate;
	}

	public void setEmploymentDate(Date employmentDate) {
		this.employmentDate = employmentDate;
	}

	public Date getResignation() {
		return resignation;
	}

	public void setResignation(Date resignation) {
		this.resignation = resignation;
	}

	public String getRectal() {
		return rectal;
	}

	public void setRectal(String rectal) {
		this.rectal = rectal;
	}

	@Override
	public String toString() {
		return "Career [cId=" + cId + ", eId=" + eId + ", c_Department=" + c_Department + ", rank=" + rank
				+ ", employmentDate=" + employmentDate + ", resignation=" + resignation + ", rectal=" + rectal + "]";
	}
	
	
}
