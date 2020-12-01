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

	@Override
	public int selectListCount() {
		return ad.selectListCount(ss);
	}

	@Override
	public ArrayList<Member> selectDiscountList(PageInfo pi) {
		return ad.selectDiscountList(pi,ss);
	}

	@Override
	public int discountSet(Lesson l) {
		return ad.discountSet(l, ss);
	}

	@Override
	public int searchDiscountCount(SearchCondition sc) {
		return ad.searchDiscountCount(sc,ss);
	}

	@Override
	public ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi) {
		return ad.searchDiscountList(sc,pi,ss);
	}

}
