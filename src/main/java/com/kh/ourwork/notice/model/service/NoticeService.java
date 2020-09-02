package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.PageInfo;

public interface NoticeService {

	// 게시글 개수
	int selectListCount();
		
	// 게시글 조회(페이징)
	ArrayList<Notice> selectList(PageInfo pi);


	// 상세보기 이거 쿠키 추가
	Notice selectNotice(int nNo, boolean flag);

	// 게시판 업데이트
	int updateNotice(Notice n);

	// 게시글 삭제
	int deleteNotice(int nNo);
	

	

}