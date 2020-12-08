package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.admin.model.dao.AdminDao;
import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.report.model.vo.Report;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private AdminDao ad;

	//할인 품관리 총 list(학천)
	@Override
	public int selectListCount() {
		return ad.selectListCount(ss);
	}
	@Override
	public ArrayList<Member> selectDiscountList(PageInfo pi) {
		return ad.selectDiscountList(pi,ss);
	}
	
	//할인 상품관리 할인율 셋팅 ajax(학천)
	@Override
	public int discountSet(Lesson l) {
		return ad.discountSet(l, ss);
	}
	
	//할인 품관리 총 list(학천)
	@Override
	public int searchDiscountCount(SearchCondition sc) {
		return ad.searchDiscountCount(sc,ss);
	}
	@Override
	public ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi) {
		return ad.searchDiscountList(sc,pi,ss);
	}

	//할인 미적용 카운트용(학천)
	@Override
	public int countDiscountUnApplied() {
		return ad.countDiscountUnApplied(ss);
	}
	@Override
	public ArrayList<Member> searchDiscountUnApplied(PageInfo pi) {
		return ad.searchDiscountUnApplied(pi,ss);
	}
	
	//할인 적용 카운트 / 검색(학천)
	@Override
	public int countDiscountApplied() {
		return ad.countDiscountApplied(ss);
	}
	@Override
	public ArrayList<Member> searchDiscountApplied(PageInfo pi) {
		return ad.countDiscountApplied(pi,ss);
	}
	
	//클래스 관리 페이지 select 문(학천)
	@Override
	public int classMgmtCountList() {
		return ad.classMgmtCountList(ss);
	}
	@Override
	public ArrayList<Lesson> classMgmtList(PageInfo pi) {
		return ad.classMgmtList(pi,ss);
	}
	
	//클래스관리 승인 처리 ajax(학천)
	@Override
	public int lessonApproval(int lessonNo) {
		return ad.lessonApproval(lessonNo,ss);
	}
	
	//클래스관리 거절 처리 ajax(학천)
	@Override
	public int rejectApproval(Lesson l) {
		return ad.rejectApproval(l, ss);
	}
	
	//클래스관리 검색시 나올 갯수/검색(학천)
	@Override
	public int searchClassMgmtCount(SearchCondition sc) {
		return ad.searchClassMgmtCount(sc,ss);
	}
	@Override
	public ArrayList<Lesson> searchClassMgmtList(SearchCondition sc, PageInfo pi) {
		return ad.searchClassMgmtList(sc,pi,ss);
	}
	
	//클래스결제 전체 list(학천)
	@Override
	public int classPaymentListCount() {
		return ad.classPaymentListCount(ss);
	}
	@Override
	public ArrayList<MemPay> classPaymentList(PageInfo pi) {
		return ad.classPaymentList(pi,ss);
	}

	//클래스결제 결제취소(학천)ajax
	@Override
	public int cancelPay(int memPayNo) {
		return ad.cancelPay(memPayNo,ss);
	}
	
	//클래스 결제 검색(학천)
	@Override
	public int searchPaymentMgmtCount(SearchCondition sc) {
		return ad.searchPaymentMgmtCount(sc,ss);
	}
	@Override
	public ArrayList<MemPay> searchPaymentMgmtList(SearchCondition sc, PageInfo pi) {
		return ad.searchPaymentMgmtList(sc,pi,ss);
	}
	
	
	/////////
	
	
	//회원 관리 페이지 select 문(성연)
	@Override
	public int memberMgmtCountList() {
		return ad.memberMgmtCountList(ss);
	}
	@Override
	public ArrayList<Member> memberMgmtList(PageInfo pi) {
		return ad.memberMgmtList(pi,ss);
	}
	
	//회원관리 검색시 나올 갯수/검색
	@Override
	public int searchMemberMgmtCount(SearchCondition sc) {
		return ad.searchMemberMgmtCount(sc,ss);
	}
	@Override
	public ArrayList<Member> searchMemberMgmtList(SearchCondition sc, PageInfo pi) {
		return ad.searchMemberMgmtList(sc,pi,ss);
	}
	
	//블랙 관리 페이지 select 문(성연)
	@Override
	public int blacklistMgmtCountList() {
		return ad.blacklistMgmtCountList(ss);
	}
	@Override
	public ArrayList<Member> blacklistMgmtList(PageInfo pi) {
		return ad.blacklistMgmtList(pi,ss);
	}
	
	//블랙리스트 관리 검색시 나올 갯수/검색
	@Override
	public int searchBlacklistMgmtCount(SearchCondition sc) {
		return ad.searchBlacklistMgmtCount(sc,ss);
	}
	@Override
	public ArrayList<Member> searchBlacklistMgmtList(SearchCondition sc, PageInfo pi) {
		return ad.searchBlacklistMgmtList(sc,pi,ss);
	}
	
	//블랙리스트 관리 검색시 나올 갯수/검색
	@Override
	public int searchInquiryMgmtCount(SearchCondition sc) {
		return ad.searchInquiryMgmtCount(sc,ss);
	}
	@Override
	public ArrayList<Inquiry> searchInquiryMgmtList(SearchCondition sc, PageInfo pi) {
		return ad.searchInquiryMgmtList(sc,pi,ss);
	}
	
	//문의 관리 페이지 select 문(성연)
	@Override
	public int inquiryMgmtCountList() {
		return ad.inquiryMgmtCountList(ss);
	}
	@Override
	public ArrayList<Inquiry> inquiryMgmtList(PageInfo pi) {
		return ad.inquiryMgmtList(pi,ss);
	}
	
	//inq답변 작성
	@Override
	public int inqAnswer(Inquiry i) {
		return ad.inqAnswer(i, ss);
	}
	
	
	
	
	
	
	//신고 관리 페이지 select 문(성연)
	@Override
	public int reportMgmtCountList() {
		return ad.reportMgmtCountList(ss);
	}
	@Override
	public ArrayList<Report> reportMgmtList(PageInfo pi) {
		return ad.reportMgmtList(pi,ss);
	}
	
	//공지사항 관리 페이지 select 문(성연)
	@Override
	public int noticeMgmtCountList() {
		return ad.noticeMgmtCountList(ss);
	}
	@Override
	public ArrayList<Notice> noticeMgmtList(PageInfo pi) {
		return ad.noticeMgmtList(pi,ss);
	}
	
	//공지 작성
	@Override
	public int insertNotice(Notice n) {
		return ad.insertNotice(ss, n);
	}
	
	//faq 관리 페이지 select 문(성연)
	@Override
	public int faqMgmtCountList() {
		return ad.faqMgmtCountList(ss);
	}
	@Override
	public ArrayList<Faq> faqMgmtList(PageInfo pi) {
		return ad.faqMgmtList(pi,ss);
	}
	
	//faq 작성
	@Override
	public int insertFaq(Faq f) {
		return ad.insertFaq(ss, f);
	}
	

}
