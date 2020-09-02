package com.kh.ourwork.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.approval.model.service.ApprovalService;
import com.kh.ourwork.approval.model.vo.LineList;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	
	//결재홈으로
	@RequestMapping("ahome.do")
	public String ApprovalHomeView() {
		return "approval/approvalMain";
	}
	
	//결재폼 작성 페이지로
	@RequestMapping("formInsertView.do")
	public String ApprovalFormInsertView(String insertform) {
		switch(insertform) {
		case "7": return "approval/holidayForm";
		default: return "redirect:ahome.do";
		}
	}
	
	//결재선 리스트 
	@RequestMapping("lList.do")
	public ModelAndView LineView(ModelAndView mv) {
		ArrayList<LineList> list = aService.selectLineList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("approval/insertLine");
		}
		return mv;
	}
	
	//결재선 추가
	@RequestMapping("linsert.do")
	public ModelAndView insertLine(ModelAndView mv, String line, String refer) {
		
		return mv;
	}
}
