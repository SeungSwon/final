package com.kh.ourwork.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.exception.NoticeException;
import com.kh.ourwork.notice.model.service.NoticeService;
import com.kh.ourwork.notice.model.vo.Notice;

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
//			여기에 loginUser담아가야함
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
		
		Attachment at = nService.selectAttachment(nNo);
		
		if(notice != null) {
			mv.addObject("notice", notice).addObject("at", at)
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
	
	// 게시판 등록
	@RequestMapping("ninsert.do")
	public String noticeInsert(Notice n, HttpServletRequest request,
							   @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/clientUploadFiles";
		File folder = new File(savePath);
		
		int result1 = nService.insertNotice(n);
		
		
		if(!file.getOriginalFilename().equals("")&& result1 >0) {
			String renameFileName = saveFile(file, request);
			String renamePath = folder + "/" + renameFileName;
			
			
			if(renameFileName != null) {
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 70);
				int result2 = nService.insertAttachment(at);
				
			}
		}
		
		if(result1>0) {
			return "redirect:noticeMain.do";
		}else {
			throw new NoticeException("게시물 등록에 실패하였습니다.");
		}
		
	}
	
	
	// 파일 저장 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/images/clientUploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));
	
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
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
	
	
	// 검색 기능
	@RequestMapping("nsearch.do")
	public String noticeSearch(Search search, Model model) {
		System.out.println("들어는 왔냐?");
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		
//		ArrayList<Notice> searchList = nService.searchList(search);
		
		return null;
	}
	
	
}
