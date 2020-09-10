package com.kh.ourwork.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.ReceiveEmail;

@Repository("mDao")
public class EmailDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int selectReceiveListCount() {
		return sqlSession.selectOne("emailMapper.selectReceiveListCount");
	}
	
	public int selectSendListCount() {
		return sqlSession.selectOne("emailMapper.selectSendListCount");
	}
	
	public int selectTempListCount() {
		return sqlSession.selectOne("emailMapper.selectTempListCount");
	}

	public ArrayList<ReceiveEmail> selectReceiveList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectReceiveList", null, rowBounds);
	}

	public ArrayList<ReceiveEmail> selectSendList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectSendList", null, rowBounds);
	}

	public ArrayList<ReceiveEmail> selectTempList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectTempList", null, rowBounds);
	}

	public int selectEmpListCount() {
		return sqlSession.selectOne("emailMapper.selectEmpListCount");
	}

	public ArrayList<EmailAddr> selectEmpAddrList() {
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmpAddrList");
	}

	/*public int testselectEmpListCount() {
		return sqlSession.selectOne("emailMapper.selectEmpListCount");
	}

	public ArrayList<EmailAddr> testselectEmpAddrList(PageInfo pi) {
		return null;
	}*/

}
