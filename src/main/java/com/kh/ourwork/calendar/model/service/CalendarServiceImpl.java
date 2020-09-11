package com.kh.ourwork.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.calendar.model.dao.CalendarDao;
import com.kh.ourwork.calendar.model.vo.Calendar;
import com.kh.ourwork.employee.model.vo.Employee;

@Service("calService")
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarDao calDao;

	@Override
	public int addEvent(Calendar cal) {

		return calDao.addEvent(cal);
	}

	@Override
	public ArrayList<Calendar> selectList() {
		
		return calDao.selectList();
	}

	@Override
	public Calendar selectCal(int sId) {
		
		return calDao.selectCal(sId);
	}

	@Override
	public int deleteCal(int sId) {
		
		return calDao.deleteCal(sId);
	}

	@Override
	public ArrayList<Calendar> selectTeamCalList(Employee e) {
		
		return calDao.selectTeamCalList(e);
	}

	@Override
	public ArrayList<Calendar> selectPersonalList(Employee e) {
		
		return calDao.selectPersonalList(e);
	}

	@Override
	public int addTeamEvent(Calendar cal) {
		
		return calDao.addTeamEvent(cal);
	}

	@Override
	public Calendar selectTeamCal(int sId) {
		
		return calDao.selectTeamCal(sId);
	}

	@Override
	public int deleteTeamCal(int sId) {

		return calDao.deleteTeamCal(sId);
	}

	@Override
	public int addPersonalEvent(Calendar cal) {
		
		return calDao.addPersonalEvent(cal);
	}

	@Override
	public int deletePersonalCal(int sId) {
		
		return calDao.deletePersonalCal(sId);
	}

	@Override
	public Calendar selectPersonalCal(int sId) {
		
		return calDao.selectPersonalCal(sId);
	}

	@Override
	public int updateCal(Calendar cal) {

		return calDao.updateCal(cal);
	}

}
