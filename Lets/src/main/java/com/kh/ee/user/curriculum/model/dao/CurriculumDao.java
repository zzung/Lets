package com.kh.ee.user.curriculum.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;

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
	
	public ArrayList<LessonFaq> selectDetailFAQ(SqlSessionTemplate sqlSession, Lesson l) {
		return (ArrayList)sqlSession.selectList("curriculumMapper.selectDetailFAQ", l);
	}
	
	public ArrayList<QnA> selectDetailQnA(SqlSessionTemplate sqlSession, Lesson l) {
		return (ArrayList)sqlSession.selectList("curriculumMapper.selectDetailQnA", l);
	}
	
	public int insertQuestion(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.insert("curriculumMapper.insertQuestion", q);
	}
	
	public int updateQuestion(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("curriculumMapper.updateQuestion", q);
	}
	
	public int deleteQuestion(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("curriculumMapper.deleteQuestion", q);
	}
	
	public int insertAnswer(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("curriculumMapper.insertAnswer", q);
	}
	
	public int updateAnswer(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("curriculumMapper.updateAnswer", q);
	}
	
	public int deleteAnswer(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.update("curriculumMapper.deleteAnswer", q);
	}
	
	public ArrayList videoList(SqlSessionTemplate sqlSession, Lesson l) {
		return (ArrayList)sqlSession.selectList("curriculumMapper.videoList", l);
	}
	
	public int updateVideoStatus(SqlSessionTemplate sqlSession, MemVideo mv) {
		return sqlSession.update("curriculumMapper.updateVideoStatus", mv);
	}
	
	public Video detailVideo(SqlSessionTemplate sqlSession, MemVideo mv) {
		return sqlSession.selectOne("curriculumMapper.detailVideo", mv);
	}
}
