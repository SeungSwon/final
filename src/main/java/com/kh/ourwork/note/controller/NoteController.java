package com.kh.ourwork.note.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.note.exception.NoteException;
import com.kh.ourwork.note.model.service.NoteService;
import com.kh.ourwork.note.model.vo.Note;
import com.kh.ourwork.note.model.vo.NoteReceiver;
import com.kh.ourwork.note.model.vo.Search;
@Controller
public class NoteController {
	@Autowired
	private NoteService ntService;
	
	@RequestMapping("ntInboxList.do")
	public ModelAndView noteInboxList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		
		int listCount = ntService.selectInboxListCount(loginUser);
	
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.selectInboxList(pi, loginUser);
	
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("note/noteInboxView");
		}else {
			throw new NoteException("받은 쪽지함 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("ntIndetail.do")
	public ModelAndView noteInboxDetail(ModelAndView mv, int ntId, @RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		 // 쪽지 상세조회
		 Note nt = ntService.selectNote(ntId);
		 
		 // 쪽지 조회 시간 INSERT
		 int result = ntService.addReceiveDate(ntId);
		 
		 if(nt != null) { 
			 mv.addObject("nt", nt).addObject("currentPage", currentPage).setViewName("note/noteInDetailView"); 
		 } else { 
			 throw new NoteException("받은 쪽지 상세조회에 실패하였습니다."); 
		 }
		return mv;
	}
	
	@RequestMapping("ntwriteView.do")
	public String noteWriteView() {
		return "note/noteWriteForm";
	}
	
	@RequestMapping("ntreceiverView.do")
	public ModelAndView noteReceiverView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = ntService.selectAllMemberCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<NoteReceiver> list = ntService.selectAllMember(pi);
		
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("note/addReceiver");
		}else {
			throw new NoteException("직원 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 쪽지 쓸 때 받는사람 검색
	@RequestMapping("ntRcvSearch.do")
	public ModelAndView receiverSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = page != null ? page : 1;
		int listCount = ntService.receiverSearchCount(search);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<NoteReceiver> list = ntService.receiverSearch(search, pi);
	
		mv.addObject("list", list).addObject("pi", pi).setViewName("note/addReceiver");
		return mv;
	}
	
	@RequestMapping("selectRcv.do")
	public ModelAndView selectReceiver(String eId, ModelAndView mv) {
		
		NoteReceiver rcv = ntService.selectReceiver(eId);
				
		mv.addObject("eId", rcv.geteId()).addObject("eName", rcv.geteName()).setViewName("note/noteWriteForm");
		return mv;
	}

	@RequestMapping("ntsend.do")
	public ModelAndView sendNote(String addReceiver, String ntContent, ModelAndView mv,HttpSession session) {
	
	int index = addReceiver.indexOf(",");
	String receiver = addReceiver.substring(0, index);
	
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	
	Note nt = new Note(loginUser.geteId(), ntContent, receiver);
	
	int result = ntService.sendNote(nt);
	
	if(result>0) {
		String msg = "쪽지가 성공적으로 전송되었습니다.";
		mv.addObject("msg", msg).setViewName("note/noteWriteForm");
	}else {
		throw new NoteException("쪽지 전송에 실패하였습니다.");
	}
	return mv;
	}
	
	@RequestMapping("ntreply.do")
	public ModelAndView replyNote(String eId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int listCount = ntService.selectInboxListCount(loginUser);
	
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		mv.addObject("eId", eId).addObject("pi", pi).setViewName("note/noteReplyForm");
		
		return mv;
	}
	
	@RequestMapping("replysend.do")
	public ModelAndView replySend(String addReceiver, String ntContent, Integer page, ModelAndView mv, HttpSession session) {
		
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");		
		int listCount = ntService.selectInboxListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		Note nt = new Note(loginUser.geteId(), ntContent, addReceiver);
		
		int result = ntService.sendNote(nt);
		
		if(result>0) {
			String msg = "쪽지가 성공적으로 전송되었습니다.";
			mv.addObject("msg", msg).addObject("pi", pi).setViewName("redirect:ntInboxList.do");
		}else {
			throw new NoteException("쪽지 전송에 실패하였습니다.");
		}
		return mv;
		}
	
	@RequestMapping("ntInDelete.do")
	public ModelAndView ntInDelete(int ntId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int listCount = ntService.selectInboxListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		int result = ntService.ntInDelete(ntId);
		
		if(result>0) {
			mv.addObject("pi", pi).setViewName("redirect:ntInboxList.do");
		}else {
			throw new NoteException("받은 쪽지 삭제에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntOutboxList.do")
	public ModelAndView noteOutboxList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {

		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int listCount = ntService.selectOutboxListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.selectOutboxList(pi, loginUser);
				
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("note/noteOutboxView");
		}else {
			throw new NoteException("보낸 쪽지함 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntOutdetail.do")
	public ModelAndView noteOutboxDetail(ModelAndView mv, int ntId, @RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		
		Note nt = ntService.selectNote(ntId);
		
		if(nt != null) {
			mv.addObject("nt", nt).addObject("currentPage", currentPage).setViewName("note/noteOutDetailView");
		}else {
			throw new NoteException("보낸 쪽지 상세조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntOutDelete.do")
	public ModelAndView ntOutDelete(int ntId, @RequestParam(value="page",required=false) Integer page, ModelAndView mv, HttpSession session) {
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");		
		int listCount = ntService.selectOutboxListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		int result = ntService.ntOutDelete(ntId);
				
		if(result>0) {
			mv.addObject("pi", pi).setViewName("redirect:ntOutboxList.do");
		}else {
			throw new NoteException("보낸 쪽지 삭제에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntInsearch.do")
	public ModelAndView noteInboxSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		search.setEmployee(loginUser);
		
		int listCount = ntService.inboxSearchListCount(search);
	
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.inboxSearchList(pi, search);
		
		mv.addObject("list", list).addObject("search", search).addObject("pi", pi).setViewName("note/noteInboxView");
		return mv;
	}
	
	@RequestMapping("ntOutsearch.do")
	public ModelAndView noteOutboxSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		search.setEmployee(loginUser);
		int listCount = ntService.outboxSearchListCount(search);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.outboxSearchList(pi, search);
		
		mv.addObject("list", list).addObject("search", search).addObject("pi", pi).setViewName("note/noteOutboxView");
		return mv;
	}
	
	@RequestMapping("ntSavesearch.do")
	public ModelAndView noteSaveSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		search.setEmployee(loginUser);
		int listCount = ntService.saveSearchListCount(search);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.saveSearchList(pi, search);
		
		mv.addObject("list", list).addObject("search", search).addObject("pi", pi).setViewName("note/noteSaveView");
		return mv;
	}
	
	//----------------------------------
	@RequestMapping("deleteInSelected.do")
	public ModelAndView deleteInSelected(@RequestParam(value="check") Integer[] check, ModelAndView mv) {
		
		int result = 0;
		
		for(int ntId : check) {
			result = ntService.ntInDelete(ntId);
			result++;
		}

		String msg = result+"개의 쪽지가 삭제되었습니다.";
		mv.addObject("msg", msg).setViewName("note/noteInboxView");
		return mv;
		
	}
	@RequestMapping("deleteOutSelected.do")
	public ModelAndView deleteOutSelected(@RequestParam(value="check") Integer[] check, ModelAndView mv) {
		
		int result = 0;
		
		for(int ntId : check) {
			result = ntService.ntOutDelete(ntId);
			result++;
		}
		String msg = result+"개의 쪽지가 삭제되었습니다.";
		mv.addObject("msg", msg).setViewName("note/noteOutboxView");
		return mv;
		
	}
	
	
	
	@RequestMapping("returnNote.do")
	public ModelAndView returnNote(int ntId, ModelAndView mv) {
		
		int result = ntService.returnNote(ntId);
		if(result>0) {
			mv.setViewName("redirect:ntOutboxList.do");
		}else {
			throw new NoteException("쪽지 발송 취소에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntInsave.do")
	public ModelAndView noteInSave(int ntId, ModelAndView mv) {
		int result = ntService.noteInSave(ntId);
		
		if(result>0) {
			mv.setViewName("redirect:ntInboxList.do");
		}else {
			throw new NoteException("쪽지 보관에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntOutsave.do")
	public ModelAndView noteOutSave(int ntId, ModelAndView mv) {
		int result = ntService.noteOutSave(ntId);
		
		if(result>0) {
			mv.setViewName("redirect:ntOutboxList.do");
		}else {
			throw new NoteException("쪽지 보관에 실패하였습니다.");
		}
		return mv;
	}
	

	@RequestMapping("ntsaveList.do")
	public ModelAndView noteSaveList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, HttpSession session) {
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int listCount = ntService.selectSaveListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Note> list = ntService.selectSaveList(pi, loginUser);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("note/noteSaveView");
		}else {
			throw new NoteException("쪽지 보관함 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("ntSavedetail.do")
	public ModelAndView noteSaveDetail(ModelAndView mv, int ntId, @RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		Note nt = ntService.selectNote(ntId);
		
		if(nt != null) {
			mv.addObject("nt", nt).addObject("currentPage", currentPage).setViewName("note/noteSaveDetailView");
		}else { 
			 throw new NoteException("받은 쪽지 상세조회에 실패하였습니다."); 
		 }
		return mv;
	}
	
	// 보관한 쪽지 삭제
	@RequestMapping("ntSaveDelete.do")
	public ModelAndView ntSaveDelete(int ntId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		int currentPage = page != null ? page : 1;
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int listCount = ntService.selectSaveListCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		Note nt = ntService.selectNote(ntId);
		
		int result = 0;
		if(nt.geteId().equals(loginUser.geteId())) {
			result = ntService.ntOutDelete(ntId);
		}else if(nt.getReceiver().equals(loginUser.geteId())) {
			result = ntService.ntInDelete(ntId);
		}
		
		if(result > 0) {
			mv.addObject("pi", pi).setViewName("redirect:ntsaveList.do");
		}else {
			throw new NoteException("쪽지 삭제에 실패하였습니다.");
		}
		return mv;
	}
	@RequestMapping("deleteSaveSelected.do")
	public ModelAndView deleteSaveSelected(@RequestParam(value="check") Integer[] check, HttpSession session, ModelAndView mv) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");

		int result = 0;
		for(int ntId : check) {
			Note nt = ntService.selectNote(ntId);
			
			if(nt.geteId().equals(loginUser.geteId())) {
				result = ntService.ntOutDelete(ntId);
			}else if(nt.getReceiver().equals(loginUser.geteId())) {
				result = ntService.ntInDelete(ntId);
			}
		}
		return mv;

	}
	
	
	
}























