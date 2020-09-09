package com.kh.ourwork.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ourwork.calendar.exception.CalendarException;
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
		
		return "calendar/calendar";
	}

	
	
	@RequestMapping("addpopup.do")
	public String popupView() {
		return "calendar/popup";
	}
	
	@RequestMapping("modifypopup.do")
	public String modifyView() {
		return "calendar/modifypopup";
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
				
		String msg = "일정이 등록되었습니다.";
		
		if(result>0) {
			mv.addObject("msg", msg).setViewName("redirect:calview.do");
		} else { 
			throw new CalendarException("일정 등록에 실패하였습니다."); 
		}
		return mv;
	}
	
	@RequestMapping("caldetail.do")
	@ResponseBody
	public String calDetail(int sId, HttpSession session) {
		
		Calendar cal = calService.selectCal(sId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				
		return gson.toJson(cal);
	}
	
	@RequestMapping("deletecal.do")
	public String deleteCal(int sId) {
		
		System.out.println("sId="+sId);
		
		int result = calService.deleteCal(sId);
		
		if(result>0) {
			return "redirect:calview.do";
		}else {
			throw new CalendarException("일정 삭제에 실패하였습니다.");
		}
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
