package com.kh.ourwork.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.calendar.model.vo.Calendar;

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

}

