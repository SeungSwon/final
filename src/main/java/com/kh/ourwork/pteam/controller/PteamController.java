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
import com.kh.ourwork.pteam.model.vo.Career;
import com.kh.ourwork.pteam.model.vo.Certifrcate;
import com.kh.ourwork.pteam.model.vo.Department;
import com.kh.ourwork.pteam.model.vo.Education;
import com.kh.ourwork.pteam.model.vo.Employee1;
import com.kh.ourwork.pteam.model.vo.Rank;

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
			
			// 퇴직사원 countlist
			int nListCount = pService.selectnListCount();
			PageInfo pin = Pagination.getPageInfo(currentPagen, nListCount);
			
			
			
			// 재직중인 사원select 부분
			ArrayList<Employee> Ylist = pService.selectList(pi);
			
			// 퇴직사원 select부분
			ArrayList<Employee> Nlist = pService.selectNList(pin);
			
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
		Employee loginUser = (Employee)session.getAttribute("loginUser");

		
		Employee employee = null;
//		Attachment at =pService.selectAttachment(eId);
		
		Certifrcate c = pService.selectC(eId);
		
		employee = pService.selectEmployee(eId);
		
		
		if(employee != null) {
			mv.addObject("employee", employee)
			  .addObject("loginUser", loginUser)
			  .addObject("c", c)
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
		
		System.out.println("들어는 왔니? 친구야?");
		ArrayList<Employee> searchList = pService.searchList(search);
		
		System.out.println("search1 : " + search);
		model.addAttribute("Ylist", searchList);
		model.addAttribute("search1", search);
		return "pteam/employeeE";
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
	
	// detail에서 수정하기 눌렀을 때
	@RequestMapping("upe.do")
	public ModelAndView employeeUpdate(ModelAndView mv, String eId, Education ed1,
										@RequestParam("page") Integer page,
										HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;

		
		Employee1 employee = pService.selectEmployee(eId);
		
		// 부서, 직급 list 가져오기
		ArrayList<Rank> rNameList = pService.selectRList();

		ArrayList<Department> dNameList = pService.selectDList();

		Certifrcate c = pService.selectC(eId);
		System.out.println("ed1 : " + ed1);
		
		Education ed2 = pService.selected1(eId);
		System.out.println("ed2 : " + ed2);
		
		if(c == null) {
			mv.addObject("employee", employee)
			.addObject("page", currentPage)
			.addObject("rName", rNameList)
			.addObject("dName", dNameList)
			.addObject("c", c)
			.setViewName("pteam/eUpdate");
		}else {
			mv.addObject("employee", employee)
			.addObject("page", currentPage)
			.addObject("rName", rNameList)
			.addObject("dName", dNameList)
			.addObject("c", c)
			.addObject("ed1", ed1)
			.setViewName("pteam/eCUpdate");
		}
		
		return mv;
	}
	
	// 자격증 등록 메소드
	@RequestMapping("ceinsert.do")
	public String cInsert(Certifrcate c, HttpServletRequest resquest,Model model,
			HttpSession session, String rName, String dName, String eId,
			@RequestParam("page") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		Employee1 employee = pService.selectEmployee(eId);
		
		int result = pService.cinsert(c);
		
		c = pService.selectC(eId);
		
		if(result > 0) {
			model.addAttribute("eId", eId);
			model.addAttribute("employee", employee);
			model.addAttribute("rName", rName);
			model.addAttribute("dName", dName);
			model.addAttribute("c", c);
			model.addAttribute("page", currentPage);
			return "redirect:upe.do";
		}else {
			throw new PteamException("자격증 등록에 실패하였습니다");
		}
		
	}
	
	// 고등학교 입력
	@RequestMapping("edhinsert.do")
	public String deInsert1(Education ed1, HttpServletRequest resquest,Model model,
			HttpSession session, String rName, String dName, String eId,
			@RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		Employee1 employee = pService.selectEmployee(eId);
		
		int result = pService.ed1insert(ed1);
		
		System.out.println("ed1 : " + ed1);
		
		if(result > 0) {
			System.out.println("여긴 고등학교 입력 : result 1");
			model.addAttribute("eId", eId);
			model.addAttribute("employee", employee);
			model.addAttribute("rName", rName);
			model.addAttribute("dName", dName);
			model.addAttribute("ed1", ed1);
			model.addAttribute("page", currentPage);
			return "redirect:upe.do";
		}else {
			System.out.println("여긴 고등학교 입력 : result 0");
			throw new PteamException("학력 등록에 실패하였습니다.");
		}
	}
	
	
	// 경력
	@RequestMapping("cainsert.do")
	public String caInsert(Career ca, HttpServletRequest resquest,Model model,
			HttpSession session, String rName, String dName, String eId,
			@RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		
		Employee1 employee = pService.selectEmployee(eId);
		
		int result = pService.cainsert(ca);
		
		ca = pService.selectCa(eId);
		
		if(result >0) {
			model.addAttribute("eId", eId);
			model.addAttribute("employee", employee);
			model.addAttribute("rName", rName);
			model.addAttribute("dName", dName);
			model.addAttribute("ca", ca);
			model.addAttribute("page", currentPage);
			return "redirect:upe.do";
		}else {
			throw new PteamException("격력 등록에 실패하였습니다.");
		}
		
	}
	
	
	
	@RequestMapping("ceupdate.do")
	public ModelAndView CeUpdateV(Certifrcate c,ModelAndView mv, String eId,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam("page") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		Employee1 employee = pService.selectEmployee(eId);
		
		int result = pService.updateCe(c);
		
		if(result > 0) {
			mv.addObject("page", currentPage)
			.addObject("emplpyee", employee)
			.addObject("eId", eId)
			.setViewName("redirect:upe.do");
		}else {
			throw new PteamException("자격증 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
}
