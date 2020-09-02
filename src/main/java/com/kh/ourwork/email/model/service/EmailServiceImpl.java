package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.email.model.dao.EmailDao;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.PageInfo;
import com.kh.ourwork.email.model.vo.ReceiveEmail;

@Service("eService")
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailDao eDao;

	@Override
	public int selectReceiveListCount() {
		return eDao.selectReceiveListCount();
	}
	
	@Override
	public int selectSendListCount() {
		return eDao.selectSendListCount();
	}
	
	@Override
	public int selectTempListCount() {
		return eDao.selectTempListCount();
	}

	@Override
	public ArrayList<ReceiveEmail> selectReceiveList(PageInfo pi) {
		return eDao.selectReceiveList(pi);
	}

	@Override
	public ArrayList<ReceiveEmail> selectSendList(PageInfo pi) {
		return eDao.selectSendList(pi);
	}

	@Override
	public ArrayList<ReceiveEmail> selectTempList(PageInfo pi) {
		return eDao.selectTempList(pi);
	}

	@Override
	public int selectEmpListCount() {
		return eDao.selectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> selectEmpAddrList() {
		return eDao.selectEmpAddrList();
	}

	/*@Override
	public int testselectEmpListCount() {
		return eDao.testselectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> testselectEmpAddrList(PageInfo pi) {
		return eDao.testselectEmpAddrList(pi);
	}*/
}
