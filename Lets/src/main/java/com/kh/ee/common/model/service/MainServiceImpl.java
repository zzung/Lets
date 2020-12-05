package com.kh.ee.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.dao.MainDao;
import com.kh.ee.user.lesson.model.vo.Lesson;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private MainDao mDao;

	@Override
	public ArrayList<Lesson> mainThumbnail() {
		return mDao.mainThumbnail(ss);
	}

	@Override
	public ArrayList<Lesson> kidsList() {
		return mDao.kidsList(ss);
	}

	@Override
	public ArrayList<Lesson> moneyList() {
		return mDao.moneyList(ss);
	}

	@Override
	public ArrayList<Lesson> hobbyList() {
		return mDao.hobbyList(ss);
	}

	@Override
	public ArrayList<Lesson> careerList() {
		return mDao.careerList(ss);
	}

	@Override
	public ArrayList<Lesson> newLessonList() {
		return mDao.newLessonList(ss);
	}

	@Override
	public ArrayList<Lesson> searchLessonList(String search) {
		return mDao.searchLessonList(ss, search);
	}

	@Override
	public ArrayList<Lesson> searchTutorList(String search) {
		return mDao.searchTutorList(ss, search);
	}
}
