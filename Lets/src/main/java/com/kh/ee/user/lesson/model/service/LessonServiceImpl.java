package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.dao.LessonDao;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;



@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private LessonDao lDao;

	@Override
	public ArrayList<Lesson> selectApproveLessonList() {
		return lDao.selectApproveLessonList(ss);
	}

	@Override
	public ArrayList<Lesson> selectApproveStatusList() {
		return lDao.selectApproveStatusList(ss);
	}

	//상세페이지에서 보여질 후기 들 (학천)
	@Override
	public ArrayList<Review> selectReview(int lessonNo) {
		return lDao.selectReview(lessonNo, ss);
	}
	
	// 레슨 상세페이지 FAQ 전체 불러오기(학천)
	@Override
	public ArrayList<LessonFaq> selectLessonFaqList(int lessonNo) {
		return lDao.selectLessonFaqList(lessonNo, ss);
	}
	
	@Override
	public int selectListCount() {
		return lDao.selectListCount(ss);
	}
	
	//ajax(학천)
	@Override
	public ArrayList<Reply> selectReply(int lessonNo) {
		
		return lDao.selectReply(lessonNo,ss);
	}
	//ajax(학천)
	@Override
	public ArrayList<Reply> selectReReplyList(int lessonNo) {

		return lDao.selectReReplyList(lessonNo, ss);
	}
	
	@Override
	public Tutor selectTutorInfo(int lessonNo) {
		return lDao.selectTutorInfo(lessonNo, ss);
	}

	@Override
	public int deleteLesson(int lno) {
		return lDao.deleteLesson(ss, lno);
	}






	
}
