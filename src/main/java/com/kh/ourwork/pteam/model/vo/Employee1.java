package com.kh.ourwork.pteam.model.vo;


import java.sql.Date;

public class Employee1 {
	private String eId;
	private int dId;
	private int rId;
	private String ePwd;
	private String eName;
	private String email;
	private String phone;
	private String address;
	private int salary;
	private Date join_date;
	private Date leave_date;
	private String status;
	private int holiday;
	private String eBirth;
	
	private String rName;
	private String dName;
	
	public Employee1() {}
	
	


	public String getdName() {
		return dName;
	}




	public void setdName(String dName) {
		this.dName = dName;
	}




	public Employee1(String eId, int dId, int rId, String ePwd, String eName, String email, String phone,
			String address, int salary, Date join_date, Date leave_date, String status, int holiday, String eBirth,
			String rName, String dName) {
		super();
		this.eId = eId;
		this.dId = dId;
		this.rId = rId;
		this.ePwd = ePwd;
		this.eName = eName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.salary = salary;
		this.join_date = join_date;
		this.leave_date = leave_date;
		this.status = status;
		this.holiday = holiday;
		this.eBirth = eBirth;
		this.rName = rName;
		this.dName = dName;
	}




	public Employee1(String eId, int dId, int rId, String ePwd, String eName, String email, String phone, String address,
			int salary, Date join_date, Date leave_date, String status, int holiday, String eBirth, String rName) {
		super();
		this.eId = eId;
		this.dId = dId;
		this.rId = rId;
		this.ePwd = ePwd;
		this.eName = eName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.salary = salary;
		this.join_date = join_date;
		this.leave_date = leave_date;
		this.status = status;
		this.holiday = holiday;
		this.eBirth = eBirth;
		this.rName = rName;
	}


	public String getrName() {
		return rName;
	}




	public void setrName(String rName) {
		this.rName = rName;
	}




	public Employee1(String eId) {
		super();
		this.eId = eId;
	}
	
	public Employee1(String eId, int dId, int rId, String ePwd, String eName, String email, String phone, String address,
			int salary, Date join_date, Date leave_date, String status, int holiday, String eBirth) {
		super();
		this.eId = eId;
		this.dId = dId;
		this.rId = rId;
		this.ePwd = ePwd;
		this.eName = eName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.salary = salary;
		this.join_date = join_date;
		this.leave_date = leave_date;
		this.status = status;
		this.holiday = holiday;
		this.eBirth = eBirth;
	}


	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getePwd() {
		return ePwd;
	}

	public void setePwd(String ePwd) {
		this.ePwd = ePwd;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getHoliday() {
		return holiday;
	}

	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}

	public String geteBirth() {
		return eBirth;
	}

	public void seteBirth(String eBirth) {
		this.eBirth = eBirth;
	}


	@Override
	public String toString() {
		return "Employee1 [eId=" + eId + ", dId=" + dId + ", rId=" + rId + ", ePwd=" + ePwd + ", eName=" + eName
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", salary=" + salary
				+ ", join_date=" + join_date + ", leave_date=" + leave_date + ", status=" + status + ", holiday="
				+ holiday + ", eBirth=" + eBirth + ", rName=" + rName + ", dName=" + dName + "]";
	}



}

