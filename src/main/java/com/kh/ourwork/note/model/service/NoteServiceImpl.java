package com.kh.ourwork.note.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.note.model.vo.Search;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.note.model.dao.NoteDao;
import com.kh.ourwork.note.model.vo.Note;
import com.kh.ourwork.note.model.vo.NoteReceiver;

@Service("ntService")
public class NoteServiceImpl implements NoteService{
	@Autowired
	private NoteDao ntDao;

	@Override
	public int selectInboxListCount(Employee m) {
		
		return ntDao.selectInboxListCount(m);
	}

	@Override
	public ArrayList<Note> selectInboxList(PageInfo pi, Employee m) {

		return ntDao.selectInboxList(pi, m);
	}

	@Override
	public Note selectNote(int ntId) {
		
		return ntDao.selectNote(ntId);
	}
	
	@Override
	public int addReceiveDate(int ntId) {
		
		return ntDao.addReceiveDate(ntId);
	}
	
	@Override
	public int receiverSearchCount(Search search) {
		
		return ntDao.receiverSearchCount(search);
	}

	@Override
	public ArrayList<NoteReceiver> receiverSearch(Search search, PageInfo pi) {
		
		return ntDao.receiverSearch(search, pi);
	}

	@Override
	public int selectAllMemberCount() {
		
		return ntDao.selectAllMemberCount();
	}

	@Override
	public ArrayList<NoteReceiver> selectAllMember(PageInfo pi) {
		
		return ntDao.selectAllMember(pi);
	}

	@Override
	public NoteReceiver selectReceiver(String eId) {
		
		return ntDao.selectReceiver(eId);
	}

	@Override
	public int sendNote(Note nt) {
		
		return ntDao.sendNote(nt);
	}

	@Override
	public int ntInDelete(int ntId) {
		
		return ntDao.ntInDelete(ntId);
	}

	@Override
	public int selectOutboxListCount(Employee m) {
		
		return ntDao.selectOutboxListCount(m);
	}

	@Override
	public ArrayList<Note> selectOutboxList(PageInfo pi, Employee m) {
		
		return ntDao.selectOutboxList(pi, m);
	}

	@Override
	public int ntOutDelete(int ntId) {

		return ntDao.ntOutDelete(ntId);
	}

	@Override
	public int inboxSearchListCount(Search search) {
		
		return ntDao.inboxSearchListCount(search);
	}

	@Override
	public ArrayList<Note> inboxSearchList(PageInfo pi,Search search) {
		
		return ntDao.inboxSearchList(pi, search);
	}

	@Override
	public int returnNote(int ntId) {
		
		return ntDao.returnNote(ntId);
	}

	@Override
	public int noteInSave(int ntId) {
		
		return ntDao.noteInSave(ntId);
	}

	@Override
	public int noteOutSave(int ntId) {
		
		return ntDao.noteOutSave(ntId);
	}

	@Override
	public int selectSaveListCount(Employee m) {

		return ntDao.selectSaveListCount(m);
	}

	@Override
	public ArrayList<Note> selectSaveList(PageInfo pi, Employee m) {
		
		return ntDao.selectSaveList(pi, m);
	}

	@Override
	public int outboxSearchListCount(Search search) {
		
		return ntDao.outboxSearchListCount(search);
	}

	@Override
	public ArrayList<Note> outboxSearchList(PageInfo pi, Search search) {
		
		return ntDao.outboxSearchList(pi, search);
	}

	@Override
	public int saveSearchListCount(Search search) {
		
		return ntDao.saveSearchListCount(search);
	}

	@Override
	public ArrayList<Note> saveSearchList(PageInfo pi, Search search) {
		
		return ntDao.saveSearchList(pi, search);
	}

}
