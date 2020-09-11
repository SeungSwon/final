package com.kh.ourwork.approval.model.service;

import java.util.ArrayList;

import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;

public interface ApprovalService {

	//결재선 리스트 조회
	public ArrayList<LineList> selectLineList();

	//기안자 정보 조회
	public ApprovalPeople selectApprovalPeople(String eId);

	//기안서 등록
	public int insertApproval(Approval a);
	
	//첨부파일 저장
	public int insertAttachment(ArrayList<Attachment> list);
	
	//첨부파일 삭제
	public int deleteAttachment(String aId);
	
	//첨부파일 조회
	public ArrayList<Attachment> selectAttachment(String aId);
	
	//첨부파일 다시 저장
	public int insertSaveAttachment(ArrayList<Attachment> list);
	
	//결재선 저장
	public int insertLine(ArrayList<Line> llist);

	//휴가원
	public int insertHoliday(Holiday h);

	//기안함 페이징
	public int selectRequestListCount(Employee m);

	public int selectRequestiListCount(Employee m);
	
	public int selectRequestyListCount(Employee m);
	
	public int selectRequestnListCount(Employee m);
	
	//기안함 조회
	public ArrayList<Approval> selectRequestList(PageInfo pi,Employee m);

	public ArrayList<Approval> selectRequestiList(PageInfo ipi,Employee m);

	public ArrayList<Approval> selectRequestyList(PageInfo ypi,Employee m);

	public ArrayList<Approval> selectRequestnList(PageInfo npi,Employee m);

	//검색 결과 페이징
	public int selectSearchListCount(String search);

	//검색결과 조회
	public ArrayList<Approval> selectSearchList(String search, PageInfo pi);

	//결재 임시저장
	public int saveApproval(Approval a);

	//임시저장함 페이징
	public int selectSaveListCount(Employee m);
	
	//임시저장함 조회
	public ArrayList<Approval> selectSaveList(PageInfo pi, Employee m);

	//임시저장함 삭제
	public int deleteSaveApproval(String[] aId);
	public int deleteLine(String[] aId);

	//상세보기 결재
	public Approval selectApproval(String aId);

	//성세보기 결재선
	public ArrayList<Line> selectLine(String aId);

	//상세기 휴가원
	public Holiday selectHoliday(String aId);

	//결재수정
	public int updateApproval(Approval a);

	//휴가원 수정
	public int updateHoliday(Holiday h);

	//결재선 변경
	public int deleteSaveLine(String aId);
	public int inserSavetLine(ArrayList<Line> llist);

	//결재대기함 페이징
	public int selectWaitingListCount(Employee m);

	public int selectWaitingiListCount(Employee m);

	public int selectWaitingyListCount(Employee m);

	public int selectWaitingnListCount(Employee m);

	//결재대기함 리스트
	public ArrayList<Approval> selectWaitingList(PageInfo pi,Employee m);

	public ArrayList<Approval> selectWaitingiList(PageInfo ipi,Employee m);

	public ArrayList<Approval> selectWaitingyList(PageInfo ypi,Employee m);

	public ArrayList<Approval> selectWaitingnList(PageInfo npi,Employee m);


}
