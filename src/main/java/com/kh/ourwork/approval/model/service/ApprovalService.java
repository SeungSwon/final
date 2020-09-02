package com.kh.ourwork.approval.model.service;

import java.util.ArrayList;

import com.kh.ourwork.approval.model.vo.LineList;

public interface ApprovalService {

	//결재선 리스트 조회
	public ArrayList<LineList> selectLineList();

}
