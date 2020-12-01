package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

public interface AdminService {

	int selectListCount();

	ArrayList<Member> selectDiscountList(PageInfo pi);

	int discountSet(Lesson l);

	int searchDiscountCount(SearchCondition sc);

	ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi);

}
