package com.kh.ee.user.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
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

	public ArrayList<MemPay> myDeliveryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.myDeliveryList", memNo);
	}

	public int myDlistCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.myDlistCount", memNo);
	}

	public MemPay myDetailDelivery(SqlSessionTemplate sqlSession, int memPayNo) {
		return sqlSession.selectOne("memberMapper.myDetailDelivery", memPayNo);
	}

	public int myUpdateDelivery(SqlSessionTemplate sqlSession, int memPayNo) {
		return sqlSession.update("memberMapper.myUpdateDelivery", memPayNo);
	}

	public int myCancelDelivery(SqlSessionTemplate sqlSession, int memPayNo) {
		return sqlSession.update("memberMapper.myCancelDelivery", memPayNo);
	}

	//(학천)할인 보여줄 ajax
	public Lesson showDiscountLesson(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.showDiscountLesson");
	}

	//마이페이지 온라이 레슨 보여주기(학천)
	public ArrayList<Lesson> selectOnlineLesson(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectOnlineLesson",memNo);
	}

	public ArrayList<Lesson> selectOffLesson(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectOffLesson",memNo);
	}

	public int totalVideo(Lesson l, SqlSessionTemplate sqlSession) {
		int result = sqlSession.selectOne("memberMapper.totalVideo",l);
		return result;
	}

	public int watchedVideo(Lesson l, SqlSessionTemplate sqlSession) {
		int result = sqlSession.selectOne("memberMapper.watchedVideo",l);
		return result;
	}


}
