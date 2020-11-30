package com.kh.ee.user.curriculum.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.curriculum.model.dao.CurriculumDao;
import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;

@Service
public class CurriculumServiceImpl implements CurriculumService{

	@Autowired
	private CurriculumDao curDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Lesson selectLesson(Lesson l) {
		return curDao.selectLesson(sqlSession, l);
	}
	@Override
	public QnA selectQnA(Lesson l) {
		return curDao.selectQnA(sqlSession, l);
	}
	@Override
	public ArrayList<Curriculum> selectCurriculum(Lesson l) {
		return curDao.selectCurriculum(sqlSession, l);
	}
	@Override
	public Lesson detailLessonInfo(Lesson l) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ArrayList<LessonFaq> detailFAQ(Lesson l) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ArrayList<QnA> detailQnA(Lesson l) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertQuestion(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateQuestion(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteQuestion(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertAnswer(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateAnswer(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteAnswer(QnA q) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ArrayList<Video> videoList(Video v) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Video detailVideo(Video v) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateVideoStatus(MemVideo mv) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int selectVideoCount(Lesson l) {
		return curDao.selectVideoCount(sqlSession, l);
	}
	
	
}
