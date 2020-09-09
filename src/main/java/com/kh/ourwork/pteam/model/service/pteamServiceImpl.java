package com.kh.ourwork.pteam.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.pteam.model.dao.pteamDao;
import com.kh.ourwork.pteam.model.vo.Employee1;

@Service("pService")
public class pteamServiceImpl implements pteamService{
	@Autowired pteamDao pDao;

	@Override
	public int selectListCount() {
		return pDao.selectListCount();
	}
	
	@Override
	public ArrayList<Employee1> selectList(PageInfo pi) {
		return pDao.selectLis(pi);
	}
	// 자격증 파일 찾기
		/*@Override
		public Attachment selectAttachment(String eId) {
			return pDao.selectAttachment(eId);
		}*/

	@Override
	public Employee1 selectEmployee(String eId) {
		return pDao.selectEmployee(eId);
	}

	@Override
	public ArrayList<Employee1> selectNList(PageInfo pin) {
		return pDao.selectNList(pin);
	}

	@Override
	public int selectnListCount() {
		return pDao.selectnListCount();
	}

	@Override
	public ArrayList<Employee1> searchList(Search search, PageInfo pi) {
		return pDao.searchList(search, pi);
	}

	@Override
	public ArrayList<Employee> nsearchList(Search search2) {
		return pDao.nselectList(search2);
	}

	@Override
	public int SselectListCount(Search search) {
		return pDao.sselectListCount(search);
	}

	

	

}
