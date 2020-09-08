package com.kh.ourwork.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.calendar.model.dao.CalendarDao;
import com.kh.ourwork.calendar.model.vo.Calendar;

@Service("calService")
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarDao calDao;

	@Override
	public int addEvent(Calendar cal) {

		return calDao.addEvent(cal);
	}

	@Override
	public ArrayList<Calendar> selectList() {
		
		return calDao.selectList();
	}
}
