package com.kh.ee.user.tutor.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.tutor.model.dao.TutorDao;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Service
public class TutorServiceImpl implements TutorService{
	
	@Autowired
	private TutorDao tutorDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertTutorInfo(Tutor t) {
		return tutorDao.insertTutorInfo(sqlSession, t);
	}

	
	
}
