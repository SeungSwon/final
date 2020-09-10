package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.dao.EmailDao;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.ReceiveEmail;

@Service("eService")
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailDao mDao;

	@Override
	public int selectReceiveListCount() {
		return mDao.selectReceiveListCount();
	}
	
	@Override
	public int selectSendListCount() {
		return mDao.selectSendListCount();
	}
	
	@Override
	public int selectTempListCount() {
		return mDao.selectTempListCount();
	}

	@Override
	public ArrayList<ReceiveEmail> selectReceiveList(PageInfo pi) {
		return mDao.selectReceiveList(pi);
	}

	@Override
	public ArrayList<ReceiveEmail> selectSendList(PageInfo pi) {
		return mDao.selectSendList(pi);
	}

	@Override
	public ArrayList<ReceiveEmail> selectTempList(PageInfo pi) {
		return mDao.selectTempList(pi);
	}

	@Override
	public int selectEmpListCount() {
		return mDao.selectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> selectEmpAddrList() {
		return mDao.selectEmpAddrList();
	}

	/*@Override
	public int testselectEmpListCount() {
		return mDao.testselectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> testselectEmpAddrList(PageInfo pi) {
		return mDao.testselectEmpAddrList(pi);
	}*/
}
