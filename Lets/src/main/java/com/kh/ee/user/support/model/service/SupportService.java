package com.kh.ee.user.support.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.notice.model.vo.Notice;

public interface SupportService {
	
	//공지사항 페이지 select 문(성연)
	int noticeCountList();
	ArrayList<Notice> noticeList(PageInfo pi);
	
	//faq 페이지 select 문(성연)
	int faqCountList();
	ArrayList<Faq> faqList(PageInfo pi);
	
	//inq 페이지 select 문(성연)
	int inqCountList();
	ArrayList<Inquiry> inqList(PageInfo pi);
	
	//공지작성
	int insertInq(Inquiry i);
	
	
}
