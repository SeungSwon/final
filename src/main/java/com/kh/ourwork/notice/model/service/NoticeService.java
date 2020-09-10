package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.Reply;

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

	// 게시글 추가
	int insertNotice(Notice n);

	int insertAttachment(Attachment at);

	Attachment selectAttachment(int nNo);

	ArrayList<Notice> searchList(Search search);

	// 수정시 기존 파일 없을때 insert
	int insertAttachment2(Attachment at);

	int updateAttachment(Attachment at);

	int deleteAttachment(Attachment at);

	//댓글 입력
	int insertReply(Reply r);

	int SselectListCount(Search search);
	

	

}
