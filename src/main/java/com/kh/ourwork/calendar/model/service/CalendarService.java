package com.kh.ourwork.calendar.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ourwork.calendar.model.vo.Calendar;
import com.kh.ourwork.employee.model.vo.Employee;


@Service("calService")
public interface CalendarService {

	int addEvent(Calendar cal);

	ArrayList<Calendar> selectList();

	Calendar selectCal(int sId);

	int deleteCal(int sId);

	ArrayList<Calendar> selectTeamCalList(Employee e);

	ArrayList<Calendar> selectPersonalList(Employee e);

	int addTeamEvent(Calendar cal);

	Calendar selectTeamCal(int sId);

	int deleteTeamCal(int sId);

	int addPersonalEvent(Calendar cal);

	int deletePersonalCal(int sId);

	Calendar selectPersonalCal(int sId);

	
}
