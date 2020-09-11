package com.kh.ourwork.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.approval.model.dao.ApprovalDao;
import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public ArrayList<LineList> selectLineList() {
		return aDao.selectLineList();
	}

	@Override
	public ApprovalPeople selectApprovalPeople(String eId) {
		return aDao.selectApprovalPeople(eId);
	}

	@Override
	public int insertApproval(Approval a) {
		return aDao.insertApproval(a);
	}
	
	@Override
	public int insertAttachment(ArrayList<Attachment> list) {
		return aDao.insertAttachment(list);
	}
	
	@Override
	public int deleteAttachment(String aId) {
		return aDao.deleteAttachment(aId);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachment(String aId) {
		return aDao.selectAttachment(aId);
	}
	
	@Override
	public int insertSaveAttachment(ArrayList<Attachment> list) {
		return aDao.insertSaveAttachment(list);
	}
	
	@Override
	public int insertLine(ArrayList<Line> llist) {
		return aDao.insertLine(llist);
	}

	@Override
	public int insertHoliday(Holiday h) {
		return aDao.insertHoliday(h);
	}

	@Override
	public int selectRequestListCount(Employee m) {
		return aDao.selectRequestListCount(m);
	}
	
	@Override
	public int selectRequestiListCount(Employee m) {
		return aDao.selectRequestiListCount(m);
	}
	
	@Override
	public int selectRequestyListCount(Employee m) {
		return aDao.selectRequestyListCount(m);
	}
	
	@Override
	public int selectRequestnListCount(Employee m) {
		return aDao.selectRequestnListCount(m);
	}

	@Override
	public ArrayList<Approval> selectRequestList(PageInfo pi, Employee m) {
		return aDao.selectRequestList(pi,m);
	}
	
	@Override
	public ArrayList<Approval> selectRequestiList(PageInfo ipi, Employee m) {
		return aDao.selectRequestiList(ipi,m);
	}

	@Override
	public ArrayList<Approval> selectRequestyList(PageInfo ypi, Employee m) {
		return aDao.selectRequestyList(ypi,m);
	}

	@Override
	public ArrayList<Approval> selectRequestnList(PageInfo npi, Employee m) {
		return aDao.selectRequestnList(npi,m);
	}

	@Override
	public int selectSearchListCount(String search) {
		return aDao.selectSearchListCount(search);
	}

	@Override
	public ArrayList<Approval> selectSearchList(String search, PageInfo pi) {
		return aDao.selectSearchList(search, pi);
	}

	@Override
	public int saveApproval(Approval a) {
		return aDao.saveApproval(a);
	}

	@Override
	public int selectSaveListCount(Employee m) {
		return aDao.selectSaveListCount(m);
	}

	@Override
	public ArrayList<Approval> selectSaveList(PageInfo pi,Employee m) {
		return aDao.selectSaveList(m);
	}

	@Override
	public int deleteSaveApproval(String[] aId) {
		return aDao.deleteSaveApproval(aId);
	}
	
	@Override
	public int deleteLine(String[] aId) {
		return aDao.deleteLine(aId);
	}


	@Override
	public Approval selectApproval(String aId) {
		return aDao.selectApproval(aId);
	}

	@Override
	public ArrayList<Line> selectLine(String aId) {
		return aDao.selectLine(aId);
	}

	@Override
	public Holiday selectHoliday(String aId) {
		return aDao.selectHoliday(aId);
	}

	@Override
	public int updateApproval(Approval a) {
		return aDao.updateApproval(a);
	}

	@Override
	public int updateHoliday(Holiday h) {
		return aDao.updateHoliday(h);
	}

	@Override
	public int deleteSaveLine(String aId) {
		return aDao.dleteSaveLine(aId);
	}

	@Override
	public int inserSavetLine(ArrayList<Line> llist) {
		return aDao.insertSaveLine(llist);
	}

	@Override
	public int selectWaitingListCount(Employee m) {
		return aDao.selectWaitingListCount(m);
	}

	@Override
	public int selectWaitingiListCount(Employee m) {
		return aDao.selectWaitingiListCount(m);
	}

	@Override
	public int selectWaitingyListCount(Employee m) {
		return aDao.selectWaitingyListCount(m);
	}

	@Override
	public int selectWaitingnListCount(Employee m) {
		return aDao.selectWaitingnListCount(m);
	}

	@Override
	public ArrayList<Approval> selectWaitingList(PageInfo pi,Employee m) {
		return (ArrayList)aDao.selectWaitingList(pi,m);
	}

	@Override
	public ArrayList<Approval> selectWaitingiList(PageInfo ipi,Employee m) {
		return (ArrayList)aDao.selectWaitingiList(ipi,m);
	}

	@Override
	public ArrayList<Approval> selectWaitingyList(PageInfo ypi,Employee m) {
		return (ArrayList)aDao.selectWaitingyList(ypi,m);
	}
	
	@Override
	public ArrayList<Approval> selectWaitingnList(PageInfo npi,Employee m) {
		return (ArrayList)aDao.selectWaitingnList(npi,m);
	}


}
