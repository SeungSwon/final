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
import com.kh.ourwork.pteam.model.vo.Employee1;

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

	public ArrayList<Employee1> selectLis(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.EselectList", null, rowBounds);
	}

	public Attachment selectAttachment(String eId) {
		return sqlSession.selectOne("pteamMapper.selectAttachMent", eId);
	}

	public Employee1 selectEmployee(String eId) {
		return sqlSession.selectOne("pteamMapper.selectOne", eId);
	}

	public ArrayList<Employee1> selectNList(PageInfo pin) {
		int offset = (pin.getCurrentPage() - 1) * pin.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pin.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.NselectList", null, rowBounds);
	}

	public int selectnListCount() {
		return sqlSession.selectOne("pteamMapper.NselectListCount");
	}

	public ArrayList<Employee1> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.searchList", search, rowBounds);
	}

	public ArrayList<Employee> nselectList(Search search2) {
		return (ArrayList)sqlSession.selectList("pteamMapper.nsearchList", search2);
	}

	public int sselectListCount(Search search) {
		return sqlSession.selectOne("pteamMapper.SselectListCount", search);
	}

}
