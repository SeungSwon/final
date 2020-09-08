package com.kh.ourwork.client.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.client.exception.ClientException;
import com.kh.ourwork.client.model.service.ClientService;
import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.client.model.vo.Search;
import com.kh.ourwork.client.model.vo.UpdateClient;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;

@Controller
public class ClientController {
	@Autowired
	private ClientService cService;
	
	@RequestMapping("clist.do")
	public ModelAndView clientList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		
		int listCount = cService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Client> list = cService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("client/clientListView");
		}else {
			throw new ClientException("거래처 목록 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("cdetail.do")
	public ModelAndView clientDetail(ModelAndView mv, int clId, @RequestParam("page") Integer page, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = page != null ? page : 1;
		
		
		Client c = cService.selectClient(clId);
		
		Attachment at = cService.selectAttachment(clId);
				
		ArrayList<UpdateClient> list = cService.selectUpdateHistory(clId);
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
		
		for(UpdateClient uc : list) {
			sdf.format(uc.getModifyDate());
		}
		
		System.out.println("list="+list);
		
		if(c != null) {
			mv.addObject("c", c).addObject("list", list).addObject("at", at).addObject("currentPage", currentPage).setViewName("client/clientDetailView");
		}else {
			throw new ClientException("거래처 상세조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	@RequestMapping("cinsertView.do")
	public String clientInsertView() {
		return "client/clientInsertForm";
	}
	
	@RequestMapping("cinsert.do")
	public String clientInsert(Client c, HttpServletRequest request, 
							   @RequestParam(value="uploadFile", required=false) MultipartFile file,
							   @RequestParam("post") String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/clientUploadFiles";
		File folder = new File(savePath);
		
		c.setcAddress(post + "," + address1 + "," + address2);

		int result1 = cService.insertClient(c);
		
		int result3 = cService.insertUpdateClient();

		
		if(!file.getOriginalFilename().equals("") && result1>0) {
			String renameFileName = saveFile(file, request);
			String renamePath = folder + "/" + renameFileName;
			
			if(renameFileName != null) {
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 60);
				int result2 = cService.insertAttachment(at);
				System.out.println("at="+at);
			}
		}		
		
		
		if(result1>0 && result3>0) {
			return "redirect:clist.do";

		}else {
			throw new ClientException("거래처 등록에 실패하였습니다.");
		}
				
	}

		
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
	
	@RequestMapping("cdelete.do")
	public String clientDelete(int clId, HttpServletRequest request) {
		
		Attachment at = cService.selectAttachment(clId);
		
		int result = cService.deleteClient(clId);
		
		int result2 = cService.deleteUpdateClient(clId);
		
		int result3 = cService.deleteAttachment(at);
		
		if(result>0) {
			return "redirect:clist.do";
		}else {
			throw new ClientException("거래처 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("cupView.do")
	public String clientUpdateView(int clId, Model model) {
		Client c = cService.selectClient(clId);
		Attachment at = cService.selectAttachment(clId);
		
		model.addAttribute("c", c).addAttribute("at", at);
		return "client/clientUpdateForm";
	}
	
	@RequestMapping("cupdate.do")
	public String clientUpdate(Client c, HttpServletRequest request, @RequestParam(value="page") Integer page,
					@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
					  ModelAndView mv, @RequestParam("post") String post,
				         @RequestParam("address1") String address1,
				         @RequestParam("address2") String address2,
				         @RequestParam("reason") String reason) {
				
		int currentPage = page != null ? page : 1;

		
		c.setcAddress(post + "," + address1 + "," + address2);
		
		Attachment at = cService.selectAttachment(c.getClId());
		
		if(at == null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/images/clientUploadFiles";
			File folder = new File(savePath);
			
			if(reloadFile != null && !reloadFile.isEmpty()) {
				String renameFileName = saveFile(reloadFile, request);
				String renamePath = folder + "/" + renameFileName;
				at = new Attachment(c.getClId(), renamePath, reloadFile.getOriginalFilename(), renameFileName);
				int result4 = cService.insertAttachment2(at);
			}
			
		}
		
        if(reloadFile != null && !reloadFile.isEmpty()) {	// at가 있고 재업로드한 파일이 있을 때
			if(at.getChangeName() != null) {
				deleteFile(at.getChangeName(), request);
				
			}
			// 새로 저장
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/images/clientUploadFiles";
			File folder = new File(savePath);
			
			String renameFileName = saveFile(reloadFile, request);
			String renamePath = folder + "/" + renameFileName;
		
			System.out.println();
			
			if(savePath != null) {
				at.setChangeName(renameFileName);
				at.setOriginName(reloadFile.getOriginalFilename());
				at.setFilePath(renamePath);
				at.setcId(c.getClId());				
			}
		}
        
		int result = cService.updateClient(c);
		UpdateClient uc = new UpdateClient(c.getClId(), "user01", reason);
		int result2 = cService.updateUpdateClient(uc);
		int result3 = cService.updateAttachment(at);

		
		
		if(result>0 && result2>0) {
			mv.addObject("currentPage", currentPage);
			return "redirect:clist.do";
		}else {
			throw new ClientException("거래처 수정에 실패하였습니다.");
		}
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/clientUploadFiles";
		
		File deleteFile = new File(savePath + "/" + fileName);
		
		if(deleteFile.exists()) {
			System.out.println("deleteFile="+deleteFile);
			deleteFile.delete();
		}
	}
	@RequestMapping("csearch.do")
	public ModelAndView clientSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
			
		
		int currentPage = page != null ? page : 1;
		
		int listCount = cService.selectSearchListCount(search);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Client> searchList = cService.searchList(search);
		
		mv.addObject("list", searchList);
		mv.addObject("search", search);
		mv.addObject("pi", pi);
		mv.setViewName("client/clientListView");
		
		return mv;
	}
	
}
























