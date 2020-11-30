package com.kh.ee.user.curriculum.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.lesson.model.vo.Lesson;

@Repository
public class CurriculumDao {

	public Lesson selectLesson(SqlSessionTemplate sqlSession, Lesson l) {
		return sqlSession.selectOne("curriculumMapper.selectLesson", l);
	}
	
	public ArrayList<Curriculum> selectCurriculum(SqlSessionTemplate sqlSession, Lesson l) {
		return (ArrayList)sqlSession.selectList("curriculumMapper.selectCurriculum", l);
	}
	
	public QnA selectQnA(SqlSessionTemplate sqlSession, Lesson l) {
		return sqlSession.selectOne("curriculumMapper.selectQnA", l);
	}
	
	public int selectVideoCount(SqlSessionTemplate sqlSession, Lesson l) {
		return sqlSession.selectOne("curriculumMapper.selectVideoCount", l);
	}
	
	public int selectAverageStar(SqlSessionTemplate sqlSession, Lesson l) {
		return sqlSession.selectOne("curriculumMapper.selectAverageStar", l);
	}
}
