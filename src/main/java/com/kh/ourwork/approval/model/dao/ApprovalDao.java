package com.kh.ourwork.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<LineList> selectLineList() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectLineList");
	}

	public ApprovalPeople selectApprovalPeople(String eId) {
		return sqlSession.selectOne("approvalMapper.selectApprovalPeople", eId);
	}

	public int insertApproval(Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval", a);
	}
	
	public int insertAttachment(ArrayList<Attachment> list) {
		return sqlSession.insert("approvalMapper.insertAttachment", list);
	}
	
	public int insertLine(ArrayList<Line> llist) {
		return sqlSession.insert("approvalMapper.insertLine", llist);
	}

	public int insertHoliday(Holiday h) {
		return sqlSession.insert("approvalMapper.insertHoliday", h);
	}

	public int selectRequestListCount() {
		return sqlSession.selectOne("approvalMapper.selectRequestListCount");
	}
	
	public int selectRequestiListCount() {
		return sqlSession.selectOne("approvalMapper.selectRequestiListCount");
	}

	public int selectRequestyListCount() {
		return sqlSession.selectOne("approvalMapper.selectRequestyListCount");
	}

	public int selectRequestnListCount() {
		return sqlSession.selectOne("approvalMapper.selectRequestnListCount");
	}

	public ArrayList<Approval> selectRequestList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestList", null, rowBounds);
	}
	
	public ArrayList<Approval> selectRequestiList(PageInfo ipi) {
		int offset = (ipi.getCurrentPage()-1) * ipi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ipi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestiList", null, rowBounds);
	}

	public ArrayList<Approval> selectRequestyList(PageInfo ypi) {
		int offset = (ypi.getCurrentPage()-1) * ypi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ypi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestyList", null, rowBounds);
	}

	public ArrayList<Approval> selectRequestnList(PageInfo npi) {
		int offset = (npi.getCurrentPage()-1) * npi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, npi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestnList", null, rowBounds);
	}

	public int selectSearchListCount(String search) {
		return sqlSession.selectOne("approvalMapper.selectSearchListCount",search);
	}

	public ArrayList<Approval> selectSearchList(String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchList", search, rowBounds);	
	}


}
