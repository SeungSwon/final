package com.kh.ourwork.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.approval.model.dao.ApprovalDao;
import com.kh.ourwork.approval.model.vo.LineList;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public ArrayList<LineList> selectLineList() {
		return aDao.selectLineList();
	}

}
