package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.dao.NoticeDao;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.Reply;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired NoticeDao nDao;

	@Override
	public int selectListCount() {
		return nDao.selectListCount();
	}
	
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(pi);
	}

	// 이거 쿠키 추가
	@Override
	public Notice selectNotice(int nNo, boolean flag) {
		// 조회수 증가 처리
		if(!flag) {
//			nDao.addReadCount(nNo);
		}
		// 게시글 조회
		return nDao.selectNotice(nNo);
	}

	// 게시글 수정
	public int updateNotice(Notice n) {
		// 여기였냐???
		return nDao.updateNotice(n);
	}

	// 게시글 삭제
	public int deleteNotice(int nNo) {
		return nDao.deleteNotice(nNo);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return nDao.insertAttachment(at);
	}

	@Override
	public Attachment selectAttachment(int nNo) {
		return nDao.selectAttachment(nNo);
	}

	@Override
	public ArrayList<Notice> searchList(Search search,PageInfo pi) {
		return nDao.searchList(search, pi);
	}

	@Override
	public int insertAttachment2(Attachment at) {
		return nDao.insertAttachment2(at);
	}

	@Override
	public int updateAttachment(Attachment at) {
		return nDao.updateAttachment(at);
	}

	@Override
	public int deleteAttachment(Attachment at) {
		return nDao.deleteAttachment(at);
	}

	@Override
	public int insertReply(Reply r) {
		return nDao.insertReply(r);
	}

	@Override
	public int SselectListCount(Search search) {
		return nDao.SselectListCount(search);
	}

	
	
	
}
