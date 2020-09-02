package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.notice.model.dao.NoticeDao;
import com.kh.ourwork.notice.model.vo.Notice;

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
		return nDao.updateNotice(n);
	}

	// 게시글 삭제
	public int deleteNotice(int nNo) {
		return nDao.deleteNotice(nNo);
	}

	
	
	
}
