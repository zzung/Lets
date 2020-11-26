package com.kh.ee.user.faq.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.faq.model.vo.Faq;

@Repository
public class FaqDao {
	
	public ArrayList<Faq> selectTutorFaqList(SqlSessionTemplate ss, Faq f) {
		return (ArrayList)ss.selectList("faqMapper.selectTutorFaqList", f);
	}

}
