package com.kh.ee.user.support.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.support.model.dao.SupportDao;

@Service
public class SupportServiceImpl implements SupportService {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private SupportDao sd;
	
	//공지사항 관리 페이지 select 문(성연)
	@Override
	public int noticeCountList() {
		return sd.noticeCountList(ss);
	}
	@Override
	public ArrayList<Notice> noticeList(PageInfo pi) {
		return sd.noticeList(pi,ss);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//faq 페이지 select 문(성연)
	@Override
	public int faqCountList() {
		return sd.faqCountList(ss);
	}
	@Override
	public ArrayList<Faq> faqList(PageInfo pi) {
		return sd.faqList(pi,ss);
	}
	
	//inq 페이지 select 문(성연)
	@Override
	public int inqCountList() {
		return sd.inqCountList(ss);
	}
	@Override
	public ArrayList<Inquiry> inqList(PageInfo pi) {
		return sd.inqList(pi,ss);
	}
	
	//inq 작성
	@Override
	public int insertInq(Inquiry i) {
		return sd.insertInq(ss, i);
	}
		
	/*
	 * @Override public int insertBoard(Board b) { return
	 * bDao.insertBoard(sqlSession, b); }
	 * 
	 * @Override public int increaseCount(int bno) { return
	 * bDao.increaseCount(sqlSession, bno); }
	 */
	
	
	
	
	
	
	
	
	
	
	

}
