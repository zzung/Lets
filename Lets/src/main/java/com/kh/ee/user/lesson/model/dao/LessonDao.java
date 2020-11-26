package com.kh.ee.user.lesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Repository
public class LessonDao {

	public ArrayList<Lesson> selectApproveLessonList(SqlSessionTemplate ss, Lesson l) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveLessonList", l);
	}
	
	public ArrayList<Lesson> selectApproveStatusList(SqlSessionTemplate ss, Lesson l) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveStatusList", l);
	}
	
	public ArrayList<Lesson> selectPrepareList(SqlSessionTemplate ss, Lesson l) {
		return (ArrayList)ss.selectList("lessonMapper.selectPrepareList", l);
	}
	
	//상세페이지에서 보여질 후기 리스트 
	public ArrayList<Review> selectReview(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectReview",lessonNo);
	}

	public ArrayList<LessonFaq> selectLessonFaqList(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectLessonFaqList",lessonNo);
	}

	public Tutor selectTutorInfo(int lessonNo, SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectTutorInfo",lessonNo);
	}
}
