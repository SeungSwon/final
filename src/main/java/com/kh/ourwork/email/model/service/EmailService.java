package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;

public interface EmailService {
	
	public int selectReceiveListCount(String id);
	
	public int selectSendListCount(String id);
	
	public int selectTempListCount(String id);

	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi);

	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi);

	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi);

	public int selectEmpListCount();

	public ArrayList<EmailAddr> selectEmpAddrList();

	public RsEmail sEmailDetail(int mId);

	public ArrayList<Ereceiver> receiverList(int mId);

	public ArrayList<Ereceiver> refList(int mId);

	public ArrayList<Ereceiver> hideList(int mId);

	public String selectSendId(int mId);

	public int insertEmail(Email e);

	public int insertRec(ArrayList<Ereceiver> rlist);

	public int insertRef(ArrayList<Ereceiver> flist);

	public int insertHid(ArrayList<Ereceiver> hlist);

	public int insertTemp(Email e);

	public ArrayList<Email> checkmId(String id);

	public int deleteReceiver(int m);

	public int againTemp(Email e);

	public int updateTempRec(ArrayList<Ereceiver> rlist);

	public int updateTempRef(ArrayList<Ereceiver> flist);

	public int updateTempHid(ArrayList<Ereceiver> hlist);

	public int updateTempToSend(Email e);

}
