package com.kh.ourwork.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.employee.model.vo.Work;



// @Repository라는 어노테이션 또한 DB와 접근하는 클래스에 부여하는 어노테이션으로
// @Component의 구체화 된 개념이다
@Repository("eDao")	 
public class EmployeeDao {
	// root-context.xml에서 작성한 bean으로 생성 된다
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Employee selectEmployee(Employee e) {
		return sqlSession.selectOne("memberMapper.selectOne", e);
	}

	public int insertEmployee(Employee e) {
		return sqlSession.insert("memberMapper.insertEmployee", e);
	}

	public int updateEmployee(Employee e) {
		return sqlSession.update("memberMapper.updateEmployee", e);
	}

	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
	
	public int checkEmailDup(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}
	
	public int insertAttachment(Attachment at) {		
		return sqlSession.insert("memberMapper.insertAttachment", at);
	}
	
	public Attachment selectAttachment(String eId) {		
		return sqlSession.selectOne("memberMapper.selectAttachment", eId);
	}
	
	public int updateAttachment(Attachment at) {
		return sqlSession.update("memberMapper.updateAttachment", at);
	}
	
	public int deleteAttachment(Attachment at) {		
		return sqlSession.update("memberMapper.deleteAttachment", at);
	}

	public int insertAttachment2(Attachment at) {		
		return sqlSession.insert("memberMapper.insertAttachment2", at);
	}

	public int employeeWIn(Work w) {
		return sqlSession.selectOne("memberMapper.employeeWIn", w);
	}

	public int employeeWOut(Work w) {
		return sqlSession.selectOne("memberMapper.employeeWOut", w);
	}


}
