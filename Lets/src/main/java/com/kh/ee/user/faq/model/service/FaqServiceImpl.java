package com.kh.ee.user.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.faq.model.dao.FaqDao;
import com.kh.ee.user.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public ArrayList<Faq> selectTutorFaqList(Faq f) {
		return faqDao.selectTutorFaqList(ss, f);
	}

}
