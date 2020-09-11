package com.kh.ourwork.client.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.client.model.vo.Search;
import com.kh.ourwork.client.model.vo.UpdateClient;
import com.kh.ourwork.common.Attachment;


@Repository("cDao")
public class ClientDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		
		return sqlSession.selectOne("clientMapper.selectListCount");
	}

	public ArrayList<Client> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("clientMapper.selectList", null, rowBounds);
	}

	public Client selectClient(int clId) {

		return sqlSession.selectOne("clientMapper.selectClient", clId);
	}

	public ArrayList<UpdateClient> selectUpdateHistory(int clId) {
		
		return (ArrayList)sqlSession.selectList("clientMapper.selectUpdateHistory", clId);
	}
	
	public int insertClient(Client c) {
		
		return sqlSession.insert("clientMapper.insertClient", c);
	}

	public int insertUpdateClient() {
		
		return sqlSession.insert("clientMapper.insertUpdateClient");
	}

	public int deleteClient(int clId) {
		
		return sqlSession.update("clientMapper.deleteClient", clId);
	}

	public int deleteUpdateClient(int clId) {
		
		return sqlSession.update("clientMapper.deleteUpdateClient", clId);
	}

	public int insertAttachment(Attachment at) {
		
		return sqlSession.insert("clientMapper.insertAttachment", at);
	}

	public int updateClient(Client c) {
		
		return sqlSession.update("clientMapper.updateClient", c);
	}

	public int updateUpdateClient(UpdateClient uc) {
		
		return sqlSession.insert("clientMapper.updateUpdateClient", uc);
	}

	public ArrayList<Client> searchList(Search search) {
		
		return (ArrayList)sqlSession.selectList("clientMapper.searchList", search);
	}

	public Attachment selectAttachment(int clId) {
		
		return sqlSession.selectOne("clientMapper.selectAttachment", clId);
	}

	public int updateAttachment(Attachment at) {
		
		return sqlSession.update("clientMapper.updateAttachment", at);
	}

	public int deleteAttachment(Attachment at) {
		
		return sqlSession.update("clientMapper.deleteAttachment", at);
	}

	public int insertAttachment2(Attachment at) {
		
		return sqlSession.insert("clientMapper.insertAttachment2", at);
	}

	public int selectSearchListCount(Search search) {
		
		return sqlSession.selectOne("clientMapper.selectSearchCount", search);
	}

	
}














