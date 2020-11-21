package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.lesson.model.dao.LessonDao;
import com.kh.ee.user.lesson.model.vo.Lesson;



@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private LessonDao lDao;

	@Override
	public ArrayList<Lesson> selectApproveLessonList(Lesson l) {
		return lDao.selectApproveLessonList(ss, l);
	}

	@Override
	public ArrayList<Lesson> selectApproveStatusList(Lesson l) {
		return lDao.selectApproveStatusList(ss, l);
	}

	@Override
	public ArrayList<Lesson> selectPrepareList(Lesson l) {
		return lDao.selectPrepareList(ss, l);
	}
	
	
}
