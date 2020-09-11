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
import com.kh.ourwork.employee.model.vo.Employee;

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

	public int deleteAttachment(String aId) {
		return sqlSession.delete("approvalMapper.deleteAttachment", aId);
	}

	public ArrayList<Attachment> selectAttachment(String aId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAttachment", aId);
	}
	
	public int insertSaveAttachment(ArrayList<Attachment> list) {
		return sqlSession.insert("approvalMapper.insertSaveAttachment", list);
	}

	public int insertLine(ArrayList<Line> llist) {
		return sqlSession.insert("approvalMapper.insertLine", llist);
	}

	public int insertHoliday(Holiday h) {
		return sqlSession.insert("approvalMapper.insertHoliday", h);
	}

	public int selectRequestListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestListCount",m);
	}
	
	public int selectRequestiListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestiListCount",m);
	}

	public int selectRequestyListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestyListCount",m);
	}

	public int selectRequestnListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestnListCount",m);
	}

	public ArrayList<Approval> selectRequestList(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestList", m, rowBounds);
	}
	
	public ArrayList<Approval> selectRequestiList(PageInfo ipi, Employee m) {
		int offset = (ipi.getCurrentPage()-1) * ipi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ipi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestiList", m, rowBounds);
	}

	public ArrayList<Approval> selectRequestyList(PageInfo ypi, Employee m) {
		int offset = (ypi.getCurrentPage()-1) * ypi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ypi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestyList", m, rowBounds);
	}

	public ArrayList<Approval> selectRequestnList(PageInfo npi, Employee m) {
		int offset = (npi.getCurrentPage()-1) * npi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, npi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestnList", m, rowBounds);
	}

	public int selectSearchListCount(String search) {
		return sqlSession.selectOne("approvalMapper.selectSearchListCount",search);
	}

	public ArrayList<Approval> selectSearchList(String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchList", search, rowBounds);	
	}

	public int saveApproval(Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval",a);
	}

	public int selectSaveListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectSaveListCount",m);
	}

	public ArrayList<Approval> selectSaveList(Employee m) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSaveList",m);
	}

	public int deleteSaveApproval(String[] aId) {
		return sqlSession.delete("approvalMapper.deleteSaveApproval", aId);
	}
	
	public int deleteLine(String[] aId) {
		return sqlSession.delete("approvalMapper.deleteLine", aId);
	}

	public Approval selectApproval(String aId) {
		return sqlSession.selectOne("approvalMapper.selectApproval", aId);
	}

	public ArrayList<Line> selectLine(String aId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectLine", aId);
	}

	public Holiday selectHoliday(String aId) {
		return sqlSession.selectOne("approvalMapper.selectHoliday", aId);
	}

	public int updateApproval(Approval a) {
		return sqlSession.update("approvalMapper.updateApproval", a);
	}

	public int updateHoliday(Holiday h) {
		return sqlSession.update("approvalMapper.updateHoliday", h);
	}

	public int dleteSaveLine(String aId) {
		return sqlSession.delete("approvalMapper.deleteSaveLine", aId);
	}

	public int insertSaveLine(ArrayList<Line> llist) {
		return sqlSession.insert("approvalMapper.insertSaveLine", llist);
	}

	public int selectWaitingListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectWaitingListCount",m);
	}

	public int selectWaitingiListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectWaitingiListCount",m);
	}

	public int selectWaitingyListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectWaitingyListCount",m);
	}

	public int selectWaitingnListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectWaitingnListCount",m);
	}

	public ArrayList selectWaitingList(PageInfo pi,Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingList", m, rowBounds);
	}

	public ArrayList selectWaitingiList(PageInfo ipi,Employee m) {
		int offset = (ipi.getCurrentPage()-1) * ipi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ipi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingiList", m, rowBounds);
	}

	public ArrayList selectWaitingyList(PageInfo ypi,Employee m) {
		int offset = (ypi.getCurrentPage()-1) * ypi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ypi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingyList", m, rowBounds);
	}
	
	public ArrayList selectWaitingnList(PageInfo npi,Employee m) {
		int offset = (npi.getCurrentPage()-1) * npi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, npi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingnList", m, rowBounds);
	}

	



}
