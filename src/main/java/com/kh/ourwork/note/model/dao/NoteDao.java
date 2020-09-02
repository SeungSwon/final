package com.kh.ourwork.note.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.client.model.vo.Search;
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

	class TestList{
		String eId;
		Search search;
		
		public TestList() {}

		public TestList(String eId, Search search) {
			super();
			this.eId = eId;
			this.search = search;
		}

		public String geteId() {
			return eId;
		}

		public void seteId(String eId) {
			this.eId = eId;
		}

		public Search getSearch() {
			return search;
		}

		public void setSearch(Search search) {
			this.search = search;
		}
		
		
	}

	
}










