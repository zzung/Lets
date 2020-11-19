package com.kh.ee.user.reply.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.reply.model.dao.ReplyDao;



@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private ReplyDao repDao;
}
