package com.kh.ourwork.pteam.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;

@Repository("pDao")
public class pteamDao {
	@Autowired SqlSessionTemplate sqlSession;
	
	/*public int selectListCount() {
		System.out.println("dao.들어는 옵니까?");
		return sqlSession.selectOne("pteamMapper.selectListCount");
	}*/
	
	public int selectListCount() {
		return sqlSession.selectOne("pteamMapper.EselectListCount");
	}

	public ArrayList<Employee> selectLis(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.EselectList", null, rowBounds);
	}

	public Attachment selectAttachment(String eId) {
		return sqlSession.selectOne("pteamMapper.selectAttachMent", eId);
	}

	public Employee selectEmployee(String eId) {
		return sqlSession.selectOne("pteamMapper.selectOne", eId);
	}

	public ArrayList<Employee> selectNList(PageInfo pin) {
		int offset = (pin.getCurrentPage() - 1) * pin.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pin.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.NselectList", null, rowBounds);
	}

	public int selectnListCount() {
		return sqlSession.selectOne("pteamMapper.NselectListCount");
	}

	public ArrayList<Employee> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("pteamMapper.searchList", search);
	}

	public ArrayList<Employee> nselectList(Search search2) {
		return (ArrayList)sqlSession.selectList("pteamMapper.nsearchList", search2);
	}

}
