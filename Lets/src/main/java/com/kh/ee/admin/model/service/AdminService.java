package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

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

}
