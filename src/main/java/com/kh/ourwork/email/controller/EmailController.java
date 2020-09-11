package com.kh.ourwork.email.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.email.model.exception.EmailException;
import com.kh.ourwork.email.model.service.EmailService;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.employee.model.vo.Employee;

@Controller
public class EmailController {
	@Autowired
	private EmailService eService;
	
	@RequestMapping("receiveMailList.do")
	public ModelAndView receiveEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectReceiveListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectReceiveList(id, pi);
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
	public ModelAndView sendEmailList( ModelAndView mv, RsEmail r,
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		r.setEeId(id);
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectSendListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectSendList(r, pi);
		
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
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectTempListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectTempList(id, pi);
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
	
	@RequestMapping("sendEmailDetailView.do")
	public String sendEmailDetailView(int mId, RsEmail r, Model model) {
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		r = eService.sEmailDetail(mId);
		
		if(r != null) {
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			return "email/sendEmailDetailView";
		} else {
			model.addAttribute("msg", "보낸메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("receiveEmailDetailView.do")
	public String receiveEmailDetailView(int mId, RsEmail r, Model model, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String sendId = eService.selectSendId(mId);
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		r = eService.sEmailDetail(mId);
		if(r != null) {
			model.addAttribute("sendId", sendId);
			model.addAttribute("id", id);
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			return "email/receiveEmailDetailView";
		} else {
			model.addAttribute("msg", "받은메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
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
	
	@RequestMapping("sendEmailGoId.do")
	public String sendEmailGoId(String eId, Model model, RsEmail r) {
		model.addAttribute("eId", eId);
		return "email/sendEmailForm";
	}
	
	@RequestMapping("esend.do")
	public String emailInsert(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		/*System.out.println(e.toString());
		for(int i = 0; i < reId.length; i++) {
			System.out.println(reId[i]);
		}
		for(int i = 0; i < feId.length; i++) {
			System.out.println(feId[i]);
		}
		for(int i = 0; i < heId.length; i++) {
			System.out.println(heId[i]);
		}
		return null;*/
		int eresult = eService.insertEmail(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		return "email/sendEmailListView";
	}
	
	@RequestMapping("etemp.do")
	public String tempInsert(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int eresult = eService.insertTemp(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		return "email/temporaryEmailListView";
	}
	
	@RequestMapping("tempDetail.do")
	public String tempDetail(int mId, RsEmail r, Model model, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String sendId = eService.selectSendId(mId);
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		r = eService.sEmailDetail(mId);
		if(r != null) {
			model.addAttribute("sendId", sendId);
			model.addAttribute("id", id);
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			return "email/tempEmailDetailForm";
		} else {
			model.addAttribute("msg", "받은메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	/* 임시저장 또다시 임시저장 */
	@RequestMapping("updateTemp.do")
	public String updateTemp(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		ArrayList<Email> elist = new ArrayList<Email>();
		elist = eService.checkmId(id);
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int m = e.getmId();
		System.out.println(m);
		int eresult = eService.againTemp(e);
		
		if(eresult > 0) {
			int deleteResult = eService.deleteReceiver(m);
		}
			
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.setmId(m);
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.updateTempRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.setmId(m);
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.updateTempRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.setmId(m);
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.updateTempHid(hlist);
		}
		
		return "email/temporaryEmailListView";
	}
	
	/* 임시저장 또다시 임시저장 */
	@RequestMapping("updateTempToSend.do")
	public String updateTempToSend(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		ArrayList<Email> elist = new ArrayList<Email>();
		elist = eService.checkmId(id);
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int m = e.getmId();
		System.out.println(m);
		int eresult = eService.updateTempToSend(e);
		
		if(eresult > 0) {
			int deleteResult = eService.deleteReceiver(m);
		}
			
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.setmId(m);
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.updateTempRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.setmId(m);
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.updateTempRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.setmId(m);
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.updateTempHid(hlist);
		}
		
		return "email/temporaryEmailListView";
	}

}
