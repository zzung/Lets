package com.kh.ee.user.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}

	public int nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck", nickname);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.selectMember", memId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.update("memberMapper.deleteMember", memId);
	}

	public ArrayList<Lesson> myWishList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.myWishList", memNo);
	}

	public int myWishListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.myWishListCount", memNo);
	}

}
