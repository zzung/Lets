package com.kh.ee.user.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.dao.MemberDao;
import com.kh.ee.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}
	@Override
	public int idCheck(String memId) {
		return mDao.idCheck(sqlSession, memId);
	}
	@Override
	public int nicknameCheck(String nickname) {
		return mDao.nicknameCheck(sqlSession, nickname);
	}
	@Override
	public Member findId(Member m) {
		return mDao.findId(sqlSession, m);
	}
	@Override
	public Member selectMember(String memId) {
		return mDao.selectMember(sqlSession, memId);
	}
	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}
	@Override
	public int deleteMember(String memId) {
		return mDao.deleteMember(sqlSession, memId);
	}
	@Override
	public ArrayList<Lesson> myWishList(int memNo) {
		return mDao.myWishList(sqlSession, memNo);
	}
	
	
}
