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
	
	//공지사항  페이지 select 문(성연)
	@Override
	public int noticeCountList() {
		return sd.noticeCountList(ss);
	}
	
	@Override
	public ArrayList<Notice> noticeList(PageInfo pi) {
		return sd.noticeList(pi,ss);
	}
	
	@Override
	public Notice supportNoticeDetail(Notice n) {
		return sd.supportNoticeDetail(ss, n);
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
	
	// FAQ 상세 페이지
	@Override
	public Faq supportFaqDetail(Faq f) {
		return sd.supportFaqDetail(ss, f);
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
	
	//inq 상세페이지 
	@Override
	public int inqDetailCountList() {
		return sd.inqDetailCountList(ss);
	}
	@Override
	public ArrayList<Inquiry> supportInqDetail(PageInfo pi) {
		return sd.supportInqDetail(pi,ss);
	}
	
	
	
	
	
	
	
	
	//inq 작성
	@Override
	public int insertInq(Inquiry i) {
		return sd.insertInq(ss, i);
	}
		
	
	
	
	
	
	
	
	
	
	

}
