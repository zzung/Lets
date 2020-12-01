package com.kh.ee.user.tutor.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.tutor.model.vo.Tutor;

@Repository
public class TutorDao {

	public int insertTutorInfo(SqlSessionTemplate sqlSession, Tutor t) {
		return sqlSession.insert("tutorMapper.insertTutorInfo", t);
	}
	
	
}
