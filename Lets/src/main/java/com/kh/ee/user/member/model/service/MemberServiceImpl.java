package com.kh.ee.user.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
