package com.kh.ee.user.tutor.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.tutor.model.vo.Tutor;

@Repository
public class TutorDao {

	public int insertTutorInfo(SqlSessionTemplate sqlSession, Tutor t) {
		return sqlSession.insert("tutorMapper.insertTutorInfo", t);
	}

	public int updateTutorInfo(SqlSessionTemplate sqlSession, Tutor t) {
		return sqlSession.update("tutorMapper.updateTutorInfo", t);
	}

	public Tutor selectTutor(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("tutorMapper.selectTutor", memNo);
	}
	
	
	
	
}
