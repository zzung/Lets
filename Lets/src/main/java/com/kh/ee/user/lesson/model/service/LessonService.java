package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList();
	
	ArrayList<Lesson> selectApproveStatusList();
	
	// 상세페이지에 뿌려줄 내용들 (학천)
	ArrayList<Review> selectReview(int lessonNo); 
	ArrayList<LessonFaq> selectLessonFaqList(int lessonNo); 
	Tutor selectTutorInfo(int lessonNo); 
	ArrayList<Reply> selectReply(int lessonNo); 
	ArrayList<Reply> selectReReplyList(int lessonNo);
	int selectListCount();

	
	int deleteLesson(int lno);



}
