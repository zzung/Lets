package com.kh.ee.user.lesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.review.model.vo.Review;

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
	
}
