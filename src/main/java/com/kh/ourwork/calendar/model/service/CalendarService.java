package com.kh.ourwork.calendar.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ourwork.calendar.model.vo.Calendar;


@Service("calService")
public interface CalendarService {

	int addEvent(Calendar cal);

	ArrayList<Calendar> selectList();
	
}
