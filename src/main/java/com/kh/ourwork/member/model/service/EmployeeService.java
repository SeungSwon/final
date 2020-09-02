package com.kh.ourwork.member.model.service;

import com.kh.ourwork.member.model.vo.Employee;

public interface EmployeeService {
	// Controller에서 서비스를 수행하기 위한 메소드의 이름을 정의하여 프로젝트에 규칙을 부여함

	// 1. 회원 로그인 서비스를 위한 메소드
	public Employee loginEmployee(Employee e);
	
	// 2. 회원 가입 서비스를 위한 메소드
	public int insertEmployee(Employee e);
	
	// 3. 회원 정보 수정을 위한 메소드
	public int updateEmployee(Employee e);

	// 4. 아이디 중복 검사를 위한 메소드
	public int checkIdDup(String id);
	
	// 5. 이메일 중복 검사를 위한 메소드
	public int checkEmailDup(String email);




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
