package com.kh.ourwork.client.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.client.model.dao.ClientDao;
import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.client.model.vo.Search;
import com.kh.ourwork.client.model.vo.UpdateClient;
import com.kh.ourwork.common.Attachment;

@Service("cService")
public class ClientServiceImpl implements ClientService{
	@Autowired
	private ClientDao cDao;

	@Override
	public int selectListCount() {
		
		return cDao.selectListCount();
	}

	@Override
	public ArrayList<Client> selectList(PageInfo pi) {
		
		return cDao.selectList(pi);
	}

	@Override
	public Client selectClient(int clId) {
		
		return cDao.selectClient(clId);
	}

	@Override
	public ArrayList<UpdateClient> selectUpdateHistory(int clId) {
		
		return cDao.selectUpdateHistory(clId);
	}

	@Override
	public int insertClient(Client c) {
		
		return cDao.insertClient(c);
	}

	@Override
	public int insertUpdateClient() {
		
		return cDao.insertUpdateClient();
	}

	@Override
	public int deleteClient(int clId) {
		
		return cDao.deleteClient(clId);
	}

	@Override
	public int deleteUpdateClient(int clId) {
		
		return cDao.deleteUpdateClient(clId);
	}

	@Override
	public int insertAttachment(Attachment at) {
		
		return cDao.insertAttachment(at);
	}

	@Override
	public int updateClient(Client c) {
		
		return cDao.updateClient(c);
	}

	
	@Override
	public int updateUpdateClient(UpdateClient uc) {
		
		return cDao.updateUpdateClient(uc);
	}

	@Override
	public ArrayList<Client> searchList(Search search) {
		
		return cDao.searchList(search);
	}

	@Override
	public Attachment selectAttachment(int clId) {
		
		return cDao.selectAttachment(clId);
	}

	
	@Override
	public int updateAttachment(Attachment at) {
		
		return cDao.updateAttachment(at);
	}

	@Override
	public int deleteAttachment(Attachment at) {
		
		return cDao.deleteAttachment(at);
	}

	@Override
	public int insertAttachment2(Attachment at) {
		
		return cDao.insertAttachment2(at);
	}

	@Override
	public int selectSearchListCount(Search search) {
		
		return cDao.selectSearchListCount(search);
	}

	
}
