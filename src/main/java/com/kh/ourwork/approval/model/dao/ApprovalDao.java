package com.kh.ourwork.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.approval.model.vo.LineList;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<LineList> selectLineList() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectLineList");
	}

}
