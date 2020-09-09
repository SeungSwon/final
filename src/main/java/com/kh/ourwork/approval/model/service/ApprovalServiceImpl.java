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
	public int insertLine(ArrayList<Line> llist) {
		return aDao.insertLine(llist);
	}

	@Override
	public int insertHoliday(Holiday h) {
		return aDao.insertHoliday(h);
	}

	@Override
	public int selectRequestListCount() {
		return aDao.selectRequestListCount();
	}
	
	@Override
	public int selectRequestiListCount() {
		return aDao.selectRequestiListCount();
	}
	
	@Override
	public int selectRequestyListCount() {
		return aDao.selectRequestyListCount();
	}
	
	@Override
	public int selectRequestnListCount() {
		return aDao.selectRequestnListCount();
	}

	@Override
	public ArrayList<Approval> selectRequestList(PageInfo pi) {
		return aDao.selectRequestList(pi);
	}
	
	@Override
	public ArrayList<Approval> selectRequestiList(PageInfo ipi) {
		return aDao.selectRequestiList(ipi);
	}

	@Override
	public ArrayList<Approval> selectRequestyList(PageInfo ypi) {
		return aDao.selectRequestyList(ypi);
	}

	@Override
	public ArrayList<Approval> selectRequestnList(PageInfo npi) {
		return aDao.selectRequestnList(npi);
	}

	@Override
	public int selectSearchListCount(String search) {
		return aDao.selectSearchListCount(search);
	}

	@Override
	public ArrayList<Approval> selectSearchList(String search, PageInfo pi) {
		return aDao.selectSearchList(search, pi);
	}



}
