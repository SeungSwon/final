package com.kh.ourwork.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.calendar.model.vo.Calendar;
import com.kh.ourwork.employee.model.vo.Employee;

@Repository("calDao")
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int addEvent(Calendar cal) {

		return sqlSession.insert("calMapper.addEvent", cal);
	}

	public ArrayList<Calendar> selectList() {

		return (ArrayList)sqlSession.selectList("calMapper.selectList");
	}

	public Calendar selectCal(int sId) {
		
		return sqlSession.selectOne("calMapper.selectCal", sId);
	}

	public int deleteCal(int sId) {
		
		return sqlSession.update("calMapper.deleteCal", sId);
	}

	public ArrayList<Calendar> selectTeamCalList(Employee e) {
		
		return (ArrayList)sqlSession.selectList("calMapper.selectTeamCalList", e);
	}

	public ArrayList<Calendar> selectPersonalList(Employee e) {
		
		return (ArrayList)sqlSession.selectList("calMapper.selectPersonalList", e);
	}

	public int addTeamEvent(Calendar cal) {
		
		return sqlSession.insert("calMapper.addTeamEvent", cal);
	}

	public Calendar selectTeamCal(int sId) {
		
		return sqlSession.selectOne("calMapper.selectTeamCal", sId);
	}

	public int deleteTeamCal(int sId) {
		
		return sqlSession.update("calMapper.deleteTeamCal", sId);
	}

	public int addPersonalEvent(Calendar cal) {
		
		return sqlSession.insert("calMapper.addPersonalEvent", cal);
	}

	public int deletePersonalCal(int sId) {
		
		return sqlSession.update("calMapper.deletePersonalCal", sId);
	}

	public Calendar selectPersonalCal(int sId) {
		
		return sqlSession.selectOne("calMapper.selectPersonalCal", sId);
	}

}

