package com.kh.ee.user.support.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.support.model.dao.SupportDao;



@Service
public class SupportServiceImpl implements SupportService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private SupportDao lDao;
}
