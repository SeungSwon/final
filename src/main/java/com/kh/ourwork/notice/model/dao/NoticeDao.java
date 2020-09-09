package com.kh.ourwork.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.Reply;

@Repository("nDao")
public class NoticeDao {
	@Autowired SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		// 몇개의 게시글을 건너 뛸 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}


	public void addReadCount(int eId) {
		sqlSession.update("noticeMapper.updateCount", eId);
	}


	public Notice selectNotice(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectOne", nNo);
	}


	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}


	public int deleteNotice(int nNo) {
		return sqlSession.update("noticeMapper.deleteNotice", nNo);
	}


	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}


	public int insertAttachment(Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment", at);
	}


	public Attachment selectAttachment(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectAttachment", nNo);
	}


	public ArrayList<Notice> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchList", search);
	}


	public int insertAttachment2(Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment2", at);
	}

	


	public int deleteAttachment(Attachment at) {
		System.out.println("deleteAttachment 다오 : 안옵니까? ");
		return sqlSession.update("noticeMapper.deleteAttachment", at);
	}


	public int updateAttachment(Attachment at) {
		System.out.println("다오 updateAtt 진짜 안들어오냐??");
		return sqlSession.update("noticeMapper.updateAttachment", at);
	}


	public int insertReply(Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}


	public int SselectListCount(Search search) {
		System.out.println(search);
		return sqlSession.selectOne("noticeMapper.SselectListCount", search);
	}


	

}
