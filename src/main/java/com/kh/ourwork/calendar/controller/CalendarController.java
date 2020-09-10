package com.kh.ourwork.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.calendar.model.service.CalendarService;
import com.kh.ourwork.calendar.model.vo.Calendar;
import com.kh.ourwork.employee.model.vo.Employee;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService calService;
	
	@RequestMapping("calview.do")
	public String calList(Model model) {
		ArrayList<Calendar> list = calService.selectList();
		model.addAttribute("list", list);
		System.out.println("calList="+list);
		return "calendar/calendar";
	}

	
	
	@RequestMapping("addpopup.do")
	public String popupView() {
		return "calendar/popup";
	}
	
	/*
	 * @RequestMapping("addEvent.do")
	 * 
	 * @ResponseBody public String addEvent(Calendar cal, HttpSession session) {
	 * Employee loginUser = (Employee)session.getAttribute("loginUser");
	 * cal.seteId(loginUser.geteId());
	 * 
	 * 
	 * }
	 */
	
	@RequestMapping("addEvent.do")
	public ModelAndView addEvent(Calendar cal, HttpSession session, ModelAndView mv) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		cal.seteId(loginUser.geteId());
		
		int result = calService.addEvent(cal);
		
		System.out.println("result="+result);
				
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
