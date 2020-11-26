package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList();
	
	ArrayList<Lesson> selectApproveStatusList();
	
	// 상세페이지에 뿌려줄 내용들 (학천)
	ArrayList<Review> selectReview(int lessonNo); 
	ArrayList<LessonFaq> selectLessonFaqList(int lessonNo); 
	Tutor selectTutorInfo(int lessonNo); 
	
	int deleteLesson(int lno);
}
