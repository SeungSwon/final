package com.kh.ourwork.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.calendar.model.dao.CalendarDao;

@Service("calService")
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarDao calDao;
}
