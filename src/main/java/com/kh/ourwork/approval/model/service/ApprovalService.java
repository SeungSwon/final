package com.kh.ourwork.approval.model.service;

import java.util.ArrayList;

import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;

public interface ApprovalService {

	//결재선 리스트 조회
	public ArrayList<LineList> selectLineList();

	//기안자 정보 조회
	public ApprovalPeople selectApprovalPeople(String eId);

	//기안서 등록
	public int insertApproval(Approval a);
	
	//첨부파일 저장
	public int insertAttachment(ArrayList<Attachment> list);
	
	//결재선 저장
	public int insertLine(ArrayList<Line> llist);

	//휴가원
	public int insertHoliday(Holiday h);

	//기안함 페이징
	public int selectRequestListCount();

	public int selectRequestiListCount();
	
	public int selectRequestyListCount();
	
	public int selectRequestnListCount();
	
	//기안함 조회
	public ArrayList<Approval> selectRequestList(PageInfo pi);

	public ArrayList<Approval> selectRequestiList(PageInfo ipi);

	public ArrayList<Approval> selectRequestyList(PageInfo ypi);

	public ArrayList<Approval> selectRequestnList(PageInfo npi);

	//검색 결과 페이징
	public int selectSearchListCount(String search);

	//검색결과 조회
	public ArrayList<Approval> selectSearchList(String search, PageInfo pi);

	
	

}
