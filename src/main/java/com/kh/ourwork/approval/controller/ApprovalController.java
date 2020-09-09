package com.kh.ourwork.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.approval.model.service.ApprovalService;
import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	
	//결재홈으로
	@RequestMapping("ahome.do")
	public String ApprovalHomeView() {
		return "approval/approvalMain";
	}
	
	//기안함
	@RequestMapping("aRequestList.do")
	public ModelAndView approvalRequestList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, String tabValue) {
		int currentPage = page !=null ? page : 1;
	
		int listCount = aService.selectRequestListCount();
		int ilistCount = aService.selectRequestiListCount();
		int ylistCount = aService.selectRequestyListCount();
		int nlistCount = aService.selectRequestnListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo ipi = Pagination.getPageInfo(currentPage, ilistCount);
		PageInfo ypi = Pagination.getPageInfo(currentPage, ylistCount);
		PageInfo npi = Pagination.getPageInfo(currentPage, nlistCount);
		
		ArrayList<Approval> list = aService.selectRequestList(pi);
		ArrayList<Approval> ilist = aService.selectRequestiList(ipi);
		ArrayList<Approval> ylist = aService.selectRequestyList(ypi);
		ArrayList<Approval> nlist = aService.selectRequestnList(npi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("ilist", ilist);
			mv.addObject("ipi", ipi);
			mv.addObject("ylist", ylist);
			mv.addObject("ypi", ypi);
			mv.addObject("nlist", nlist);
			mv.addObject("npi", npi);
			mv.addObject("tabValue", tabValue);
			mv.setViewName("approval/approvalRequest");
		}
		return mv;
	}
	
	//결재폼 작성 페이지로
	@RequestMapping("aFormView.do")
	public String ApprovalFormInsertView(String insertform, String eId, ApprovalPeople apeople, Model model) {
		
		apeople = aService.selectApprovalPeople(eId);
		
		switch(insertform) {
		case "1":
			model.addAttribute("apeople", apeople);
			return "approval/expenditureccForm";
		case "2": 
			model.addAttribute("apeople", apeople);
			return "approval/resignationForm";
		case "3": 
			model.addAttribute("apeople", apeople);
			return "approval/inspectorForm";
		case "4": 
			model.addAttribute("apeople", apeople);
			return "approval/certificateForm";
		case "5": 
			model.addAttribute("apeople", apeople);
			return "approval/reinstatementForm";
		case "6": 
			model.addAttribute("apeople", apeople);
			return "approval/leaveFrom";
		case "7": 
			model.addAttribute("apeople", apeople);
			return "approval/holidayForm";
		case "8": 
			model.addAttribute("apeople", apeople);
			return "approval/draftForm";
		case "9": 
			model.addAttribute("apeople", apeople);
			return "approval/proportsForm";
		case "10": 
			model.addAttribute("apeople", apeople);
			return "approval/spendingForm";
		default:  
			return "redirect:ahome.do";
		}
	}
	
	//결재선 리스트 
	@RequestMapping("lList.do")
	public ModelAndView LineView(ModelAndView mv) {
		ArrayList<LineList> list = aService.selectLineList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("approval/insertLine");
		}
		return mv;
	}
	
	// 휴가원
	@RequestMapping("holidayInsert.do")
	public String holidayInsert(Approval a, Holiday h, String[] leId, String[] lLevel, HttpServletRequest request,
			@RequestParam(value = "uploadFile", required = false) MultipartFile[] file) {
		
		System.out.println(file.length);

		ArrayList<Attachment> list = new ArrayList<Attachment>();
		ArrayList<Line> llist = new ArrayList<Line>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\auploadFiles";
		File folder = new File(savePath);
		
		if (file.length > 0) {
			
			for (int i = 0; i < file.length; i++) {
				String renameFileName = saveFile(file[i], request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file[i].getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					list.add(at);
				}
			}
		}
		
		int j=1;
		for(int i=0; i<leId.length; i++) {
			Line l = new Line();
			l.setLeId(leId[i]);
			if(lLevel[i].equals("결재")) {
				l.setlLevel(j);
				j++;
			}else {
				l.setlLevel(0);
			}
			llist.add(l);
		}
		
		int aresult = aService.insertApproval(a);
		int hresult = aService.insertHoliday(h);
		int atresult = aService.insertAttachment(list);
		int result = aService.insertLine(llist);

		return "redirect:aRequestList.do";

	}

	// 파일 저장을 위한 별도 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		// 해당 resources는 webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\auploadFiles";

		File folder = new File(savePath); // savePath 폴더를 불러와서
		// 해당 폴더 경로가 존재하는지 확인하고
		if (!folder.exists()) {// 존재하지 않는다면
			folder.mkdirs(); // 해당 경로를 먼저 생성한다
		}

		// 파일 rename 규칙 -> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		// 실제 저장 될 파일 경로 + "\\" + 넘어온 파일명

		
		// 이 메소드가 실행되는 순간 해당 경로(filePath)에 넘어온 MultipartFile이 저장된다
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return renameFileName;
	}
	
	//검색
	@RequestMapping("asearch.do")
	public String ApprovalSearch(String search, Model model,  @RequestParam(value="page", required=false) Integer page) {
		int currentPage = page !=null ? page : 1;
		
		System.out.println(currentPage);
		
		int listCount = aService.selectSearchListCount(search);
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println(pi);
		
		ArrayList<Approval> searchList = aService.selectSearchList(search, pi);
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("search", search);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		
		return "approval/searchList";
		
	}
	

}
