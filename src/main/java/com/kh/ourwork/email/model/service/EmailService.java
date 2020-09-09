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

	public ArrayList<RsEmail> selectSendList(String id, PageInfo pi);

	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi);

	public int selectEmpListCount();

	public ArrayList<EmailAddr> selectEmpAddrList();

	public RsEmail sEmailDetail(int mId);

	public ArrayList<Ereceiver> sreceiverList(int mId);

	public ArrayList<Ereceiver> srefList(int mId);

	public ArrayList<Ereceiver> shideList(int mId);

	public ArrayList<Ereceiver> rreceiverList(int mId);

	public ArrayList<Ereceiver> rrefList(int mId);

	public ArrayList<Ereceiver> rhideList(int mId);

	public String selectSendId(int mId);

	public int insertEmail(Email e);

	public int insertRec(ArrayList<Ereceiver> rlist);

	public int insertRef(ArrayList<Ereceiver> flist);

	public int insertHid(ArrayList<Ereceiver> hlist);

}
