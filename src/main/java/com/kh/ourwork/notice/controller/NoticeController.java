package com.kh.ourwork.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.notice.model.exception.NoticeException;
import com.kh.ourwork.notice.model.service.NoticeService;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.PageInfo;
import com.kh.ourwork.common.Pagination;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("noticeMain.do")
	public ModelAndView noticeList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		
		// 1. 전체 게시글 개수 수 리턴 받기
		int listCount = nService.selectListCount();
		
		// 페이징 정보 만들기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("notice/noticeMain");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 아마 eId가 없어서 에러 뜨는거같습니다.(로그인 안해서)
	@RequestMapping("detail.do")
	public ModelAndView notice(ModelAndView mv, int nNo,
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;
		
		
		Notice notice = null;
		boolean flag= false;
		/* Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies ) {
				if(c.getName().equals("eId"+eId)){
					// 해당 게시글에 대한 쿠기 존재(이미 읽음)
					flag = true;
				}
			}
			if(!flag) { // 게시글을 처음 읽을 경우 쿠키 저장하기
				Cookie c = new Cookie("eId"+eId, String.valueOf(eId));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 저장
				response.addCookie(c);
			}
			notice = nService.selectNotice(eId, nNo, flag);
		}*/
		
		
		notice = nService.selectNotice(nNo, flag);
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("currentPage", currentPage)
			  .setViewName("notice/noticeDetail");
		}else {
			throw new NoticeException("게시글 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 작서하기 페이지 이동
	@RequestMapping("noticeInsert.do")
	public String noticeInsertV() {
		return "notice/noticeInsert";
	}
	
	
	// detail에서 수정하기 버튼 눌렀을 때
	@RequestMapping("upno.do")
	public ModelAndView noticeUpdateV(ModelAndView mv, int nNo, 
									@RequestParam("page") Integer page) {
		Notice notice = nService.selectNotice(nNo, true);
		
		mv.addObject("notice", notice)
		  .addObject("currentPage", page)
		  .setViewName("notice/noticeUpdate");
		
		return mv;
	}
	
	// 수정페이지에서 수정을 눌럿을때
	@RequestMapping("updateno.do")
	public ModelAndView noticeUpdate(ModelAndView mv, Notice n,
									HttpServletRequest request,
									@RequestParam("page") Integer page) { // noticeUpdate.jsp에서 파일추가해야함!
		
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			mv.addObject("page", page)
				.setViewName("redirect:noticeMain.do");
		}else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 게시판 삭제
	@RequestMapping("deno.do")
	public String NoticeDelete(int nNo, HttpServletRequest request) {
		Notice n = nService.selectNotice(nNo, false);
		
		// 여기에 파일 삭제 메소드 추가!! 해야함 BoardController에 다있음!
		
		int result = nService.deleteNotice(nNo);
		
		if(result > 0) {
			return "redirect:noticeMain.do";
		}else {
			throw new NoticeException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	
}
