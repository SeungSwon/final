package com.kh.ourwork.client.model.service;

import java.util.ArrayList;

import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.client.model.vo.Search;
import com.kh.ourwork.client.model.vo.updateClient;
import com.kh.ourwork.common.Attachment;

public interface ClientService {

	int selectListCount();

	ArrayList<Client> selectList(PageInfo pi);

	Client selectClient(int clId);

	ArrayList<updateClient> selectUpdateHistory(int clId);

	int insertClient(Client c);

	int insertUpdateClient();

	int deleteClient(int clId);

	int deleteUpdateClient(int clId);

	int insertAttachment(Attachment at);

	int updateClient(Client c);

	int updateUpdateClient(updateClient uc);

	ArrayList<Client> searchList(Search search);

	Attachment selectAttachment(int clId);

	int updateAttachment(Attachment at);

	int deleteAttachment(Attachment at);

	// 수정 시 기존 파일 없을 때 INSERT
	int insertAttachment2(Attachment at);

	// 검색한 리스트 개수
	int selectSearchListCount(Search search);


}
