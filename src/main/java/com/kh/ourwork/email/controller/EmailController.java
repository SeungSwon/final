package com.kh.ourwork.email.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.AddrPagination;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.email.model.exception.EmailException;
import com.kh.ourwork.email.model.service.EmailService;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.PageInfo;
import com.kh.ourwork.email.model.vo.ReceiveEmail;
import com.kh.ourwork.employee.model.vo.Employee;

@Controller
public class EmailController {
	@Autowired
	private EmailService eService;
	
	@RequestMapping("receiveMailList.do")
	public ModelAndView receiveEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectReceiveListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ReceiveEmail> list = eService.selectReceiveList(pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/receiveEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("sendMailList.do")
	public ModelAndView sendEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectSendListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ReceiveEmail> list = eService.selectSendList(pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/sendEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("temporaryEmailList.do")
	public ModelAndView temporaryEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectTempListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<ReceiveEmail> list = eService.selectTempList(pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/temporaryEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("sendMail.do")
	public String boardInsertView() {
		return "email/sendEmailForm";
	}
	
	/*@RequestMapping("emailAddr.do")
	public String emailAddrView() {
		return "email/emailAddr";
	}*/
	
	@RequestMapping("emailAddr.do")
	public ModelAndView emailAddrView(ModelAndView mv) {
		ArrayList<EmailAddr> list = eService.selectEmpAddrList();
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("email/emailAddr");
		} else {
			throw new EmailException("주소록 조회 실패");
		}
		return mv;
	}
	
	/*@RequestMapping("emailAddr.do")
	public ModelAndView testemailAddrView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = eService.testselectEmpListCount();
		PageInfo pi = AddrPagination.getPageInfo(currentPage, listCount);
		ArrayList<EmailAddr> list = eService.testselectEmpAddrList(pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/testAddr");
		} else {
			throw new EmailException("주소록 조회 실패");
		}
		return mv;
	}*/
	
	/*@RequestMapping(value="emailAddr.do")
    public ResponseEntity<Map<String,Object>> testemailAddrView(@PathVariable("board_num") int board_num,
            @PathVariable("page") int page){
        //ResponseEntity 쓰면 list는물론 HttpStatus(접속 상태)도 같이 보낼 수 있다.
        ResponseEntity<Map<String,Object>> entity = null;
        PageInfo pi = new PageInfo();
        PageInfo.setPage(page);
        PageInfo.setTotalCount(eService.testselectEmpListCount(board_num));
        try{
            Map<String,Object> map = new HashMap<String,Object>();
            //map 구조: {board_num:1, paging:{startNum:1, endNum:10,...}, list:{} }
            map.put("paging", paging);
            map.put("board_num", board_num);
            map.put("list", dao.list(map));
            entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
        }catch(Exception e){
            entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }*/

}
