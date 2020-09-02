package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.PageInfo;
import com.kh.ourwork.email.model.vo.ReceiveEmail;

public interface EmailService {
	
	public int selectReceiveListCount();
	
	public int selectSendListCount();
	
	public int selectTempListCount();

	public ArrayList<ReceiveEmail> selectReceiveList(PageInfo pi);

	public ArrayList<ReceiveEmail> selectSendList(PageInfo pi);

	public ArrayList<ReceiveEmail> selectTempList(PageInfo pi);

	public int selectEmpListCount();

	public ArrayList<EmailAddr> selectEmpAddrList();

	/*public int testselectEmpListCount();

	public ArrayList<EmailAddr> testselectEmpAddrList(PageInfo pi);*/


}
