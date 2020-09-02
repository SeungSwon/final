package com.kh.ourwork.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("calDao")
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
