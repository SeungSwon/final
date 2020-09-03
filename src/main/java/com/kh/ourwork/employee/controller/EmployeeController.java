package com.kh.ourwork.employee.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ourwork.employee.model.exception.EmployeeException;
import com.kh.ourwork.employee.model.service.EmployeeService;
import com.kh.ourwork.employee.model.vo.Employee;



@SessionAttributes({ "loginUser", "msg" })
@Controller // Controller 타입의 어노테이션을 붙여주면 빈 스캐닝을 통해 자동으로 빈으로 등록 된다

public class EmployeeController {
	// 아래와 같이 Autowired 타입의 어노테이션을 붙여주면 생성할 필요 없이 변수로 선언만 해도
	// 빈 스캐닝을 통해 아래의 mService의 이름을 가지고 있는 빈을 찾아서 자동으로 생성해줌
	@Autowired
	private EmployeeService eService;

	// 2_3. 로거 객체
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@RequestMapping("eJoin.do")
	public String joinView() {
		return "member/memberJoin";
	}

	@RequestMapping("eAddress.do")
	public String addressView() {
		return "member/memberAddress";
	}

	@RequestMapping("eCalendar.do")
	public String calendarView() {
		return "member/memberCalendar";
	}

	@RequestMapping("eMypage.do")
	public String mypageView() {
		return "member/memberMypage";
	}

	@RequestMapping("memberJoin.do")
	public String employeeInsert(Employee e, RedirectAttributes rd, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2) {

		

		e.setAddress(post + "," + address1 + "," + address2);

		int result = eService.insertEmployee(e);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
			return "redirect:/index.do";
		} else {
			throw new EmployeeException("회원가입에 실패하였습니다.");
		}
	}

	// 암호화 처리 후 최종 로그인 메소드
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String employeeLogin(Employee e, Model model) {
		Employee loginUser = eService.loginEmployee(e);

		System.out.println(e);

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);

//				// 로그인 성공 시 로그 출력
//				if(logger.isDebugEnabled()) {
//					
//					logger.info(loginUser.geteId() + " 로그인");
//				}
		} else {
			throw new EmployeeException("로그인에 실패하였습니다.");
		}
		return "redirect:home.do";
	}

	
	@RequestMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("index.do");
        return mv;
    }

	
	  @RequestMapping("eUpdate.do") 
	  public String updateView() { 
		  return "member/memberUpdate"; 
	  }
	 

	// 회원정보 수정 메소드
	// 성공 시 msg "회원정보가 수정 되었습니다"를 가지고 home.do로 redirect -> alert
	// 실패 시 "회원 정보 수정에 실패하였습니다"라는 메세지를 가지고 Exception 처리
	@RequestMapping("memberUpdate.do")
	public String employeeUpdate(Employee e, Model model, @RequestParam("post") String post,
			@RequestParam("address1") String addr1, @RequestParam("address2") String addr2, RedirectAttributes rd) {

		e.setAddress(post + "," + addr1 + "," + addr2);

		int result = eService.updateEmployee(e);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
			model.addAttribute("loginUser", e);
			return "redirect:memberMypage.do";
		} else {
			throw new EmployeeException("회원 정보 수정에 실패하였습니다");
		}

	}

	// 2. JsonView를 이용한 방법
	// dependency 라이브러리 추가 후 JsonView, BeanNameViewResolver 빈 등록 후 사용
	@RequestMapping("dupid.do")
	public ModelAndView idDuplicateCheck(String eId, ModelAndView mv) {
		boolean isUsable = eService.checkIdDup(eId) == 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");

		System.out.println(eId);

		return mv;
	}

	@RequestMapping("edupid.do")
	public ModelAndView emailDuplicateCheck(String email, ModelAndView mv) {
		boolean isUsable = eService.checkEmailDup(email) == 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");

		System.out.println(email);

		return mv;
	}
	
	@RequestMapping(value = "/upload" , method = RequestMethod.POST) 
	
	public String upload(MultipartHttpServletRequest mtf) throws Exception { 
		// 파일 태그
		String fileTag = "file"; 
		// 업로드 파일이 저장될 경로 
		String filePath = "C:\\temp\\"; 
		// 파일 이름
		MultipartFile file = mtf.getFile(fileTag); 
		String fileName = file.getOriginalFilename(); 
		// 파일 전송 
		try { 
			file.transferTo(new File(filePath + fileName)); 
			} catch(Exception e) { 
				System.out.println("업로드 오류"); 
				}
		
		return fileName; //++
	}


}
