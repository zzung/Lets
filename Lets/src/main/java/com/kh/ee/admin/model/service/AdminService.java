package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.report.model.vo.Report;

public interface AdminService {
	
	//ajax(학천)할인율 셋팅
	int discountSet(Lesson l);

	//할인 품관리 총 list(학천)
	ArrayList<Member> selectDiscountList(PageInfo pi);
	int selectListCount();

	//할인 상품관리 검색(학천)
	ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi);
	int searchDiscountCount(SearchCondition sc);
	
	//할인 미적용 카운트 / 검색(학천)
	int countDiscountUnApplied();
	ArrayList<Member> searchDiscountUnApplied(PageInfo pi);

	//할인 적용 카운트 / 검색(학천)
	int countDiscountApplied();
	ArrayList<Member> searchDiscountApplied(PageInfo pi);

	//클래스 관리 페이지 select 문(학천)
	int classMgmtCountList();
	ArrayList<Lesson> classMgmtList(PageInfo pi);

	//클래스관리 승인 처리 ajax(학천)
	int lessonApproval(int lessonNo);
	
	//클래스관리 거절 처리 ajax(학천)
	int rejectApproval(Lesson l);

	//클래스관리 검색시 나올 갯수/검색(학천)
	int searchClassMgmtCount(SearchCondition sc);
	ArrayList<Lesson> searchClassMgmtList(SearchCondition sc, PageInfo pi);

	//클래스결제 전체 list(학천)
	int classPaymentListCount();
	ArrayList<MemPay> classPaymentList(PageInfo pi);

	//클래스결제 결제취소(학천)ajax
	int cancelPay(int memPayNo);

	//클래스 결제 검색(학천)
	int searchPaymentMgmtCount(SearchCondition sc);
	ArrayList<MemPay> searchPaymentMgmtList(SearchCondition sc, PageInfo pi);
	
	//////////////
	
	//회원 관리 페이지 select 문(성연)
	int memberMgmtCountList();
	ArrayList<Member> memberMgmtList(PageInfo pi);
	
	//블랙 관리 페이지 select 문(성연)
	int blacklistMgmtCountList();
	ArrayList<Member> blacklistMgmtList(PageInfo pi);
	
	//신고 관리 페이지 select 문(성연)
	int reportMgmtCountList();
	ArrayList<Report> reportMgmtList(PageInfo pi);
	
	//공지사항 관리 페이지 select 문(성연)
	int noticeMgmtCountList();
	ArrayList<Notice> noticeMgmtList(PageInfo pi);
	
	//공지작성
	int insertNotice(Notice n);
	
	//faq 관리 페이지 select 문(성연)
	int faqMgmtCountList();
	ArrayList<Faq> faqMgmtList(PageInfo pi);
	
	//FAQ 작성
	int insertFaq(Faq f);
	
}
