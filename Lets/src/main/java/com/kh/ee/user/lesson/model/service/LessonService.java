package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.review.model.vo.Review;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList(Lesson l);
	
	ArrayList<Lesson> selectApproveStatusList(Lesson l);
	
	ArrayList<Lesson> selectPrepareList(Lesson l);
	
	ArrayList<LessonFaq> selectLessonFaqList(int lessonNo); 
	
	ArrayList<Review> selectReview(int lessonNo); 

}
