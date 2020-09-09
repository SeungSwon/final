package com.kh.ourwork.note.model.vo;

import com.kh.ourwork.employee.model.vo.Employee;

public class Search {
	private String searchCondition;
	private String searchValue;
	private String existFile;
	private Employee employee;
	
	public Search() {}

	public Search(String searchCondition, String searchValue, String existFile) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.existFile = existFile;
	}
	
	
	public Search(String searchCondition, String searchValue, String existFile, Employee employee) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.existFile = existFile;
		this.employee = employee;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getExistFile() {
		return existFile;
	}

	public void setExistFile(String existFile) {
		this.existFile = existFile;
	}
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", existFile="
				+ existFile + ", employee=" + employee + "]";
	}
	
}
