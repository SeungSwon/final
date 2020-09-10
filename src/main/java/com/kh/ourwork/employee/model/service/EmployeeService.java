package com.kh.ourwork.employee.model.service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.employee.model.vo.Work;

public interface EmployeeService {
	// Controller에서 서비스를 수행하기 위한 메소드의 이름을 정의하여 프로젝트에 규칙을 부여함

	// 회원 로그인 서비스를 위한 메소드
	public Employee loginEmployee(Employee e);
	
	public Employee findEmployee();
	
	// 회원 가입 서비스를 위한 메소드
	public int insertEmployee(Employee e);
	
	// 회원 정보 수정을 위한 메소드
	public int updateEmployee(Employee e);

	// 아이디 중복 검사를 위한 메소드
	public int checkIdDup(String id);
	
	// 이메일 중복 검사를 위한 메소드
	public int checkEmailDup(String email);
	
	// 파일업로드를 위한 메소드
	public int insertAttachment(Attachment at);
	
	public int updateAttachment(Attachment at);
	
	public int deleteAttachment(Attachment at);
	
	Attachment selectAttachment(String eId);
	
	// 수정 시 기존 파일 없을 때 INSERT
	public int insertAttachment2(Attachment at);
	
	//출근 시간 저장을 위한 메소드
	public int employeeWIn(Work w);
	
	//퇴근 시간 저장을 위한 메소드
	public int employeeWOut(Work w);
	
	//출퇴근시간을 출력하기 위한 메소드
	public int employeeTime(Work w);
	
}
