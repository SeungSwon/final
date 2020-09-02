package com.kh.ourwork.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.member.model.vo.Employee;

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


}
