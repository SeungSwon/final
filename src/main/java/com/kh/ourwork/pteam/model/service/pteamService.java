package com.kh.ourwork.pteam.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;

public interface pteamService {

	int selectListCount();

	ArrayList<Employee> selectList(PageInfo pi);

	/*Attachment selectAttachment(String eId);*/

	Employee selectEmployee(String eId);

	ArrayList<Employee> selectNList(PageInfo pin);

	int selectnListCount();

	ArrayList<Employee> searchList(Search search);

	ArrayList<Employee> nsearchList(Search search2);

}
