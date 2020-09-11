package com.kh.ourwork.note.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.note.model.vo.Search;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.note.model.vo.Note;
import com.kh.ourwork.note.model.vo.NoteReceiver;

@Repository("ntDao")
public class NoteDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int selectInboxListCount(Employee m) {
		
		return sqlSession.selectOne("noteMapper.selectInboxListCount", m);
	}

	public ArrayList<Note> selectInboxList(PageInfo pi, Employee m) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.selectInboxList", m, rowBounds);
	}

	public Note selectNote(int ntId) {
		
		return sqlSession.selectOne("noteMapper.selectNote", ntId);
	}
	
	public int addReceiveDate(int ntId) {
		
		return sqlSession.update("noteMapper.addReceiveDate", ntId);
	}


	public int receiverSearchCount(Search search) {
		
		return sqlSession.selectOne("noteMapper.receiverSearchCount", search);
	}

	public ArrayList<NoteReceiver> receiverSearch(Search search, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.receiverSearch", search, rowBounds);
	}

	public int selectAllMemberCount() {
		
		return sqlSession.selectOne("noteMapper.selectAllMemberCount");
	}

	public ArrayList<NoteReceiver> selectAllMember(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.selectAllMember", null, rowBounds);
	}

	public NoteReceiver selectReceiver(String eId) {

		return sqlSession.selectOne("noteMapper.selectReceiver", eId);
	}

	public int sendNote(Note nt) {
		
		return sqlSession.insert("noteMapper.sendNote", nt);
	}

	public int ntInDelete(int ntId) {
		
		return sqlSession.update("noteMapper.ntInDelete", ntId);
	}

	public int selectOutboxListCount(Employee m) {
		
		return sqlSession.selectOne("noteMapper.selectOutboxListCount", m);
	}

	public ArrayList<Note> selectOutboxList(PageInfo pi, Employee m) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.selectOutboxList", m, rowBounds);
	}

	public int ntOutDelete(int ntId) {
		
		return sqlSession.update("noteMapper.ntOutDelete", ntId);
	}

	public int inboxSearchListCount(Search search) {
			
		return sqlSession.selectOne("noteMapper.inboxSearchListCount", search);
	}

	public ArrayList<Note> inboxSearchList(PageInfo pi, Search search) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.inboxSearchList", search, rowBounds);
	}
		

	public int returnNote(int ntId) {
		
		return sqlSession.update("noteMapper.returnNote", ntId);
	}

	public int noteInSave(int ntId) {
		
		return sqlSession.update("noteMapper.noteInSave", ntId);
	}

	public int noteOutSave(int ntId) {
		
		return sqlSession.update("noteMapper.noteOutSave", ntId);
	}

	public int selectSaveListCount(Employee m) {
		
		return sqlSession.selectOne("noteMapper.selectSaveListCount", m);
	}

	public ArrayList<Note> selectSaveList(PageInfo pi, Employee m) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.selectSaveList", m, rowBounds);
	}

	public int outboxSearchListCount(Search search) {
		
		return sqlSession.selectOne("noteMapper.outboxSearchListCount", search);
	}

	public ArrayList<Note> outboxSearchList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.outboxSearchList", search, rowBounds);
	}

	public int saveSearchListCount(Search search) {
		
		return sqlSession.selectOne("noteMapper.saveSearchListCount", search);
	}

	public ArrayList<Note> saveSearchList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noteMapper.saveSearchList", search, rowBounds);
	}


	
}










