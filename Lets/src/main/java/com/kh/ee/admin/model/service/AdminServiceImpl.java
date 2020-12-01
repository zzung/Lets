package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.admin.model.dao.AdminDao;
import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

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
	public int rejectApproval(int lessonNo) {
		return ad.rejectApproval(lessonNo, ss);
	}

}
