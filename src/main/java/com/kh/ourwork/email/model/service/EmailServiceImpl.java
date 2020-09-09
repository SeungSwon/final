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
	public ArrayList<RsEmail> selectSendList(String id, PageInfo pi) {
		return mDao.selectSendList(id, pi);
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
	public ArrayList<Ereceiver> sreceiverList(int mId) {
		return mDao.sreceiverList(mId);
	}

	@Override
	public ArrayList<Ereceiver> srefList(int mId) {
		return mDao.srefList(mId);
	}

	@Override
	public ArrayList<Ereceiver> shideList(int mId) {
		return mDao.shideList(mId);
	}

	@Override
	public ArrayList<Ereceiver> rreceiverList(int mId) {
		return mDao.rreceiverList(mId);
	}

	@Override
	public ArrayList<Ereceiver> rrefList(int mId) {
		return mDao.rrefList(mId);
	}

	@Override
	public ArrayList<Ereceiver> rhideList(int mId) {
		return mDao.rhideList(mId);
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

}
