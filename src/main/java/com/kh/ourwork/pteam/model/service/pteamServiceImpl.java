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
	public ArrayList<Employee> selectList(PageInfo pi) {
		return pDao.selectLis(pi);
	}
	// 자격증 파일 찾기
		/*@Override
		public Attachment selectAttachment(String eId) {
			return pDao.selectAttachment(eId);
		}*/

	@Override
	public Employee selectEmployee(String eId) {
		return pDao.selectEmployee(eId);
	}

	@Override
	public ArrayList<Employee> selectNList(PageInfo pin) {
		return pDao.selectNList(pin);
	}

	@Override
	public int selectnListCount() {
		return pDao.selectnListCount();
	}

	@Override
	public ArrayList<Employee> searchList(Search search) {
		return pDao.searchList(search);
	}

	@Override
	public ArrayList<Employee> nsearchList(Search search2) {
		return pDao.nselectList(search2);
	}

	

	

}
