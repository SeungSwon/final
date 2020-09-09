package com.kh.ourwork.pteam.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.pteam.model.vo.Employee1;

public interface pteamService {

	int selectListCount();

	ArrayList<Employee1> selectList(PageInfo pi);

	/*Attachment selectAttachment(String eId);*/

	Employee1 selectEmployee(String eId);

	ArrayList<Employee1> selectNList(PageInfo pin);

	int selectnListCount();

	ArrayList<Employee1> searchList(Search search, PageInfo pi);

	ArrayList<Employee> nsearchList(Search search2);

	int SselectListCount(Search search);

}
