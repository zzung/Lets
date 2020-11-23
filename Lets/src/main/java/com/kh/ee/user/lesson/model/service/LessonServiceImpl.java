package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.lesson.model.dao.LessonDao;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.review.model.vo.Review;



@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private LessonDao lDao;

	@Override
	public ArrayList<Lesson> selectApproveLessonList(Lesson l) {
		return lDao.selectApproveLessonList(ss, l);
	}

	@Override
	public ArrayList<Lesson> selectApproveStatusList(Lesson l) {
		return lDao.selectApproveStatusList(ss, l);
	}

	@Override
	public ArrayList<Lesson> selectPrepareList(Lesson l) {
		return lDao.selectPrepareList(ss, l);
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
	
	
}
