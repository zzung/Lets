package com.kh.ee.admin.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.member.model.vo.Member;

public interface AdminService {

	int selectListCount();

	ArrayList<Member> selectDiscountList(PageInfo pi);

}
