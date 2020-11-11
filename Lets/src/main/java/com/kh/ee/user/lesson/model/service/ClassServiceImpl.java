package com.kh.ee.user.lesson.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.lesson.model.dao.ClassDao;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private ClassDao cDao;
}
