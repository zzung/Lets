package com.kh.ee.user.member.model.service;

import java.util.ArrayList;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	int insertMember(Member m);
	int idCheck(String memId);
	int nicknameCheck(String nickname);
	Member findId(Member m);
	Member selectMember(String memId);
	int updatePwd(Member m);
	int updateMember(Member m);
	int deleteMember(String memId);
	ArrayList<Lesson> myWishList(int memNo);
	int myWishListCount(int memNo);
	ArrayList<MemPay> myDeliveryList(int memNo);
	int myDlistCount(int memNo);
	MemPay myDetailDelivery(int memPayNo);
	int myUpdateDelivery(int memPayNo);
	int myCancelDelivery(int memPayNo);
	
	//(학천)할인 보여줄 ajax
	Lesson showDiscountLesson();

}
