package com.kh.ourwork.pteam.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.notice.model.exception.NoticeException;
import com.kh.ourwork.notice.model.service.NoticeService;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.Reply;
import com.kh.ourwork.pteam.model.exception.PteamException;
import com.kh.ourwork.pteam.model.service.pteamService;
import com.kh.ourwork.pteam.model.vo.Employee1;

@Controller
public class PteamController {
	@Autowired
	private pteamService pService;
	
	private Logger logger = LoggerFactory.getLogger(PteamController.class);
	
	// 여기서부터 인사쪽관리!!!!!!!!!!!
		@RequestMapping("pteam.do")
		public String vacation() {
			return "pteam/vacation";
		}
		
		@RequestMapping("employeeE.do")
		public ModelAndView employeeEList(ModelAndView mv, HttpSession session,
				@RequestParam(value="page", required=false) Integer page,
				@RequestParam(value="pagen", required=false) Integer pagen) {
			int currentPage = page != null ? page : 1;
			
			int currentPagen = pagen != null ? pagen : 1;
			
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			
			// 재직사원 countlist
			int listCount = pService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			System.out.println("재직사원 listCount; : " + listCount);
			
			// 퇴직사원 countlist
			int nListCount = pService.selectnListCount();
			PageInfo pin = Pagination.getPageInfo(currentPagen, nListCount);
			
			
			
			// 재직중인 사원select 부분
			ArrayList<Employee1> Ylist = pService.selectList(pi);
			
			System.out.println("Ylist : " + Ylist);
			
			// 퇴직사원 select부분
			ArrayList<Employee1> Nlist = pService.selectNList(pin);
			
			if(Ylist != null) {
				mv.addObject("Ylist", Ylist);
				mv.addObject("Nlist", Nlist);
				mv.addObject("loginUser", loginUser);
				mv.addObject("pi", pi);
				mv.addObject("pin", pin);
				mv.setViewName("pteam/employeeE");
			}else {
				mv.addObject("msg", "인사관리 목록 조회에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
			
			return mv;
		}
	
	
	@RequestMapping("edetail.do")
	public ModelAndView employeeD(ModelAndView mv, String eId, HttpSession session,
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		int currentPage = page != null ? page : 1;
		
		System.out.println("디테일.do eId : " + eId);
		Employee loginUser = (Employee)session.getAttribute("loginUser");

		
		Employee1 employee = null;
//		Attachment at =pService.selectAttachment(eId);
		
		employee = pService.selectEmployee(eId);
		
		System.out.println("employee: " + employee);
		
		if(employee != null) {
			mv.addObject("employee", employee)
			  .addObject("loginUser", loginUser)
			  .addObject("currentPage", currentPage)
			  .setViewName("pteam/eDetail");
			
		}else {
			throw new PteamException("사원 상세조회에 실패하였습니다.");
		}
		return mv;
	}
	
	
	// 검색 기능 재직중!
	@RequestMapping("esearch1.do")
	public String employeeSearch(Search search, Model model,
			@RequestParam("page") Integer page) {
		System.out.println("page : " + page);
		int currentPage = page != null ? page : 1;
		
		int listCount = pService.SselectListCount(search);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Employee1> searchList = pService.searchList(search, pi);
		
		System.out.println("search1 : " + search);
		model.addAttribute("Ylist", searchList);
		model.addAttribute("pi", pi);
		model.addAttribute("search1", search);
		return "pteam/employeeSearchE";
	}
	
	// 검색 기능 퇴사사원!
	/*@RequestMapping("esearch2.do")
	public String nemployeeSearch(Search search2, Model model) {
		ArrayList<Employee> searchList = pService.nsearchList(search2);
		
		System.out.println("search : " + search2);
		
		model.addAttribute("Nlist", searchList);
		model.addAttribute("search", search2);
		
		return "pteam/employeeE";
	}*/
	
	
	
}
