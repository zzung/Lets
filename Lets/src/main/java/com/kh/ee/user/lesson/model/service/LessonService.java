package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.report.model.vo.Report;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList(int memNo);
	
	ArrayList<Lesson> selectApproveStatusList(int memNo);
	
	// 상세페이지에 뿌려줄 내용들 (학천)
	Lesson selectLessonList(int lessonNo);
	ArrayList<Review> selectReview(int lessonNo); 
	ArrayList<LessonFaq> selectLessonFaqList(int lessonNo); 
	Tutor selectTutorInfo(int lessonNo); 
	int selectListCount();
	//ajax(학천)
	ArrayList<Reply> selectReply(int lessonNo); 
	int insertReply(Reply r);
	int deleteReply(int replyNo);
	int updateReply(Reply r);
	int insertReReply(Reply r);
	int deleteReReply(Reply r);
	int updateReReply(Reply r);
	int reportReply(Report rpt);
	//int likeCount(int lessonNo);
	//
	
	int deleteLesson(int lno);

	//키즈 화면에 뿌려줄것(학천)
	ArrayList<Lesson> selectKidsPop();
	ArrayList<Lesson> selectKidsNew();
	ArrayList<Lesson> selectKidsDisc();
	ArrayList<Lesson> selectKidsAll();












}
