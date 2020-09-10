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
	
	@RequestMapping("teamcalview.do")
	public String teamcalList(Model model, HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		
		ArrayList<Calendar> list = calService.selectTeamCalList(e);
		model.addAttribute("list", list);
		
		return "calendar/teamcalendar";
	}
	
	@RequestMapping("personalcalview.do")
	public String personalcalList(Model model, HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		ArrayList<Calendar> list = calService.selectPersonalList(e);
		
		model.addAttribute("list", list);
		
		return "calendar/personalcalendar";
	}
	
	
	@RequestMapping("addpopup.do")
	public String popupView() {
		return "calendar/popup";
	}
	
	@RequestMapping("addteampopup.do")
	public String teamPopupView() {
		return "calendar/addteampopup";
	}

	@RequestMapping("addpersonalpopup.do")
	public String personalPopupView() {
		return "calendar/addpersonalpopup";
	}
	@RequestMapping("modifypopup.do")
	public String modifyView() {
		return "calendar/modifypopup";
	}
	
	// 일정 추가
	
	@RequestMapping("addEvent.do")
	@ResponseBody
	public String addEvent(Calendar cal, HttpSession session, ModelAndView mv) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		cal.seteId(loginUser.geteId());
		int result = calService.addEvent(cal);
										
		if(result>0) {
			return "success";
		} else { 
			return "fail";
		}
	}
	
	@RequestMapping("addteamEvent.do")
	@ResponseBody
	public String addTeamEvent(Calendar cal, HttpSession session, ModelAndView mv) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		cal.seteId(loginUser.geteId());
		cal.setdId(loginUser.getdId());
		int result = calService.addTeamEvent(cal);
		
		if(result>0) {
			mv.addObject("cal", cal);
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("addpersonalEvent.do")
	@ResponseBody
	public String addPersonalEvent(Calendar cal, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		cal.seteId(loginUser.geteId());
		int result = calService.addPersonalEvent(cal);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 상세 조회
	
	@RequestMapping("caldetail.do")
	@ResponseBody
	public String calDetail(int sId, HttpSession session, Model model) {
		
		Calendar cal = calService.selectCal(sId);
		model.addAttribute("cal", cal);
				
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				
		return gson.toJson(cal);
	}
	
	@RequestMapping("teamcaldetail.do")
	@ResponseBody
	public String teamCalDetail(int sId) {
		Calendar cal = calService.selectTeamCal(sId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(cal);
	}
	
	@RequestMapping("personalcaldetail.do")
	@ResponseBody
	public String personalCalDetail(int sId) {
		Calendar cal = calService.selectPersonalCal(sId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(cal);
	}
	
	// 삭제
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
	
	@RequestMapping("deleteteamcal.do")
	public String deleteTeamCal(int sId) {
		int result = calService.deleteTeamCal(sId);
		
		if(result>0) {
			return "redirect:teamcalview.do";
		}else {
			throw new CalendarException("일정 삭제에 실패하였습니다.");
		}
			
	}
	
	@RequestMapping("deletepersonalcal.do")
	public String deletePersonalCal(int sId) {
		
		int result = calService.deletePersonalCal(sId);
		
		if(result>0) {
			return "redirect:personalcalview.do";
		}else {
			throw new CalendarException("일정 삭제에 실패하였습니다.");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
