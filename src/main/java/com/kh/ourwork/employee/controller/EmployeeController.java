package com.kh.ourwork.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ourwork.client.exception.ClientException;
import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.client.model.vo.UpdateClient;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.employee.model.exception.EmployeeException;
import com.kh.ourwork.employee.model.service.EmployeeService;
import com.kh.ourwork.employee.model.vo.Employee;

@SessionAttributes({ "loginUser", "msg" })
@Controller

public class EmployeeController {

	@Autowired
	private EmployeeService eService;

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

	// ID찾기
	@RequestMapping("findId.do")
	public String findIdView() {
		return "member/memberId";
	}

	// PW찾기
	@RequestMapping("findPwd.do")
	public String findPwdView() {
		return "member/memberId";
	}

	@RequestMapping("logout")
	public String logoutView() {
		return "index.do";
	}

	@RequestMapping("eUpdate.do")
	public String updateView() {
		return "member/memberUpdate";
	}

	@RequestMapping("memberMypage.do")
	public String myPageView() {
		return "member/memberMypage";
	}

	// 암호화 처리 후 최종 로그인 메소드
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String employeeLogin(Employee e, Model model) {
		Employee loginUser = eService.loginEmployee(e);

//		System.out.println("login.do" + e);

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);

//			// 로그인 성공 시 로그 출력
//			if (logger.isDebugEnabled()) {
//
//				logger.info(loginUser.geteId() + " 로그인");
//			}
		} else {
			throw new EmployeeException("로그인에 실패하였습니다.");
		}
		return "redirect:home.do";
	}

	// 회원가입 메소드
	@RequestMapping("memberJoin.do")

	public String employeeInsert(Employee e, RedirectAttributes rd, HttpServletRequest request, 
			   @RequestParam(value="uploadFile", required=false) MultipartFile file, 
			   @RequestParam("post") String post,
			   @RequestParam("address1") String address1, 
			   @RequestParam("address2") String address2) {
  System.out.println("emplyee : " + e);
		
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\profileUploadFiles";
		File folder = new File(root + "\\images\\profileUploadFiles");

		e.setAddress(post + "," + address1 + "," + address2);

		int result = eService.insertEmployee(e);

		if (!file.getOriginalFilename().equals("") && result > 0) {
			String renameFileName = saveFile(file, request);
			String renamePath = "/resources/images/profileUploadFiles";

			if (renameFileName != null) {
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 60);
				int result2 = eService.insertEmployee(e);
			}
		}

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
			return "redirect:/index.do";
		} else {
			throw new EmployeeException("회원가입에 실패하였습니다.");
		}
	}

	// 파일 저장을 위한 별도 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		// 해당 resources는 webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\profileUploadFiles";

		File folder = new File(savePath);
		// savePath 폴더를 불러와서
		// 해당 폴더 경로가 존재하는지 확인하고


		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

	// --------------------------------------------------------------------------------
	// 회원정보 수정 메소드
	@RequestMapping("memberUpdate.do")
	public String employeeUpdate(Model model, HttpServletRequest request,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile, HttpSession session,
			@RequestParam("post") String post, @RequestParam("address1") String addr1,
			@RequestParam("address2") String addr2, @RequestParam("email") String email,
			@RequestParam("phone") String phone, RedirectAttributes rd) {

		Employee e = (Employee) session.getAttribute("loginUser");

		e.setAddress(post + "," + addr1 + "," + addr2);
		e.setEmail(email);
		e.setPhone(phone);

		System.out.println("e" + e);

		// input type="file"에 파일이 업로드 되었을때
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 프로필 업로드
			Attachment at = eService.selectAttachment(e.geteId());
			String savePath = "\\images\\profileUploadFiles";

			// 등록된 프로필 사진이 없는 경우
			if (at == null) {

				String renameFileName = saveFile(reloadFile, request);

				at = new Attachment(e.geteId(), savePath, reloadFile.getOriginalFilename(), renameFileName);
				int result4 = eService.insertAttachment2(at);

				System.out.println("Attachment : " + at);
				System.out.println("Employee : " + e);
				System.out.println("savePath : " + savePath);
				System.out.println("---------------");

			} else { // 등록된 프로필 사진이 있는 경우 & 변경하기 위해 파일을 업로드 한 경우
				if (at.getChangeName() != null) {
					deleteFile(at.getChangeName(), request);
				}

				String renameFileName = saveFile(reloadFile, request);

				if (renameFileName != null) {
					at = new Attachment(e.geteId(), savePath, reloadFile.getOriginalFilename(), renameFileName);

					System.out.println("savePath2 : " + savePath);
					System.out.println("---------------");

				}

				int result3 = eService.updateAttachment(at);
			}
			
			e.setProfile(at);
		}

		int result = eService.updateEmployee(e);
		if (result > 0) {
			rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다.");
			model.addAttribute("loginUser", e);
			return "redirect:memberMypage.do";
		} else {
			throw new EmployeeException("회원 정보 수정에 실패하였습니다");
		}
	}

	// 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\profileUploadFiles";

		File deleteFile = new File(savePath + "\\" + fileName);

		if (deleteFile.exists()) {
			deleteFile.delete();
		}

		System.out.println("root3 : " + root);
		System.out.println("savePath3 : " + savePath);
		System.out.println("deleteFile : " + deleteFile);
		System.out.println("---------------");
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

}
