package com.kh.ourwork.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;

@Repository("mDao")
public class EmailDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int selectReceiveListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectReceiveListCount", id);
	}
	
	public int selectSendListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectSendListCount", id);
	}
	
	public int selectTempListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectTempListCount", id);
	}

	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectReceiveList", id, rowBounds);
	}

	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(rowBounds);
		return (ArrayList)sqlSession.selectList("emailMapper.selectSendList", r, rowBounds);
	}

	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectTempList", id, rowBounds);
	}

	public int selectEmpListCount() {
		return sqlSession.selectOne("emailMapper.selectEmpListCount");
	}

	public ArrayList<EmailAddr> selectEmpAddrList() {
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmpAddrList");
	}

	public RsEmail sEmailDetail(int mId) {
		return sqlSession.selectOne("emailMapper.sEmailDetail", mId);
	}

	public ArrayList<Ereceiver> receiverList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.receiverList", mId);
	}

	public ArrayList<Ereceiver> refList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.refList", mId);
	}

	public ArrayList<Ereceiver> hideList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.hideList", mId);
	}

	public String selectSendId(int mId) {
		return sqlSession.selectOne("emailMapper.selectSendId", mId);
	}

	public int insertEmail(Email e) {
		return sqlSession.insert("emailMapper.insertEmail", e);
	}

	public int insertRec(ArrayList<Ereceiver> rlist) {
		return sqlSession.insert("emailMapper.insertRec", rlist);
	}

	public int insertRef(ArrayList<Ereceiver> flist) {
		return sqlSession.insert("emailMapper.insertRef", flist);
	}

	public int insertHid(ArrayList<Ereceiver> hlist) {
		return sqlSession.insert("emailMapper.insertHid", hlist);
	}

	public int insertTemp(Email e) {
		return sqlSession.insert("emailMapper.insertTemp", e);
	}

	public ArrayList<Email> checkmId(String id) {
		return (ArrayList)sqlSession.selectList("emailMapper.checkmId", id);
	}

	public int deleteReceiver(int m) {
		return sqlSession.delete("emailMapper.deleteReceiver", m);
	}

	public int againTemp(Email e) {
		return sqlSession.update("emailMapper.againTemp", e);
	}

	public int updateTempRec(ArrayList<Ereceiver> rlist) {
		return sqlSession.insert("emailMapper.updateTempRec", rlist);
	}

	public int updateTempRef(ArrayList<Ereceiver> flist) {
		return sqlSession.insert("emailMapper.updateTempRef", flist);
	}

	public int updateTempHid(ArrayList<Ereceiver> hlist) {
		return sqlSession.insert("emailMapper.updateTempHid", hlist);
	}

	public int updateTempToSend(Email e) {
		return sqlSession.update("emailMapper.updateTempToSend", e);
	}

}
