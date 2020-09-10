package com.kh.ourwork;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ourwork.employee.model.exception.EmployeeException;
import com.kh.ourwork.employee.model.service.EmployeeService;
import com.kh.ourwork.employee.model.vo.Employee;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private EmployeeService eService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Employee e = eService.findEmployee();
		System.out.println("home.do e" + e);
		model.addAttribute("loginUser", e);
//		"Employee" loginUser = eService.loginEmployee(e);
//		
//		System.out.println("e"+e+"loginUser"+loginUser);
//		
//		if (loginUser != null) {
//			model.addAttribute("loginUser", loginUser);
//		} else {
//			throw new EmployeeException("로그인에 실패하였습니다.");
//		}
//		
		return "home";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}
	
}
