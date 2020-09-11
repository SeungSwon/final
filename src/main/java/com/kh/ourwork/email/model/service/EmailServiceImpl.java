package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.dao.EmailDao;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;

@Service("eService")
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailDao mDao;

	@Override
	public int selectReceiveListCount(String id) {
		return mDao.selectReceiveListCount(id);
	}
	
	@Override
	public int selectSendListCount(String id) {
		return mDao.selectSendListCount(id);
	}
	
	@Override
	public int selectTempListCount(String id) {
		return mDao.selectTempListCount(id);
	}

	@Override
	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi) {
		return mDao.selectReceiveList(id, pi);
	}

	@Override
	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi) {
		return mDao.selectSendList(r, pi);
	}

	@Override
	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi) {
		return mDao.selectTempList(id, pi);
	}

	@Override
	public int selectEmpListCount() {
		return mDao.selectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> selectEmpAddrList() {
		return mDao.selectEmpAddrList();
	}

	@Override
	public RsEmail sEmailDetail(int mId) {
		return mDao.sEmailDetail(mId);
	}

	@Override
	public ArrayList<Ereceiver> receiverList(int mId) {
		return mDao.receiverList(mId);
	}

	@Override
	public ArrayList<Ereceiver> refList(int mId) {
		return mDao.refList(mId);
	}

	@Override
	public ArrayList<Ereceiver> hideList(int mId) {
		return mDao.hideList(mId);
	}

	@Override
	public String selectSendId(int mId) {
		return mDao.selectSendId(mId);
	}

	@Override
	public int insertEmail(Email e) {
		return mDao.insertEmail(e);
	}

	@Override
	public int insertRec(ArrayList<Ereceiver> rlist) {
		return mDao.insertRec(rlist);
	}

	@Override
	public int insertRef(ArrayList<Ereceiver> flist) {
		return mDao.insertRef(flist);
	}

	@Override
	public int insertHid(ArrayList<Ereceiver> hlist) {
		return mDao.insertHid(hlist);
	}

	@Override
	public int insertTemp(Email e) {
		return mDao.insertTemp(e);
	}

	@Override
	public ArrayList<Email> checkmId(String id) {
		return mDao.checkmId(id);
	}

	@Override
	public int deleteReceiver(int m) {
		return mDao.deleteReceiver(m);
	}

	@Override
	public int againTemp(Email e) {
		return mDao.againTemp(e);
	}

	@Override
	public int updateTempRec(ArrayList<Ereceiver> rlist) {
		return mDao.updateTempRec(rlist);
	}

	@Override
	public int updateTempRef(ArrayList<Ereceiver> flist) {
		return mDao.updateTempRef(flist);
	}

	@Override
	public int updateTempHid(ArrayList<Ereceiver> hlist) {
		return mDao.updateTempHid(hlist);
	}

	@Override
	public int updateTempToSend(Email e) {
		return mDao.updateTempToSend(e);
	}

}
