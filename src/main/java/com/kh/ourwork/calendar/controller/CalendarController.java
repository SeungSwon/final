package com.kh.ourwork.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ourwork.calendar.model.service.CalendarService;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService calService;
	
	@RequestMapping("calview.do")
	public String calendarView() {
		return "calendar/calendar";
	}
}
