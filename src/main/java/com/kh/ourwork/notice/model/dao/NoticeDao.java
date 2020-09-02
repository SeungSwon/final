package com.kh.ourwork.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.PageInfo;

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


	

}
