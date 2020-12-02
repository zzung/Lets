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
	public ArrayList<LessonFaq> detailFAQ(Lesson l) {
		return curDao.selectDetailFAQ(sqlSession, l);
	}
	@Override
	public ArrayList<QnA> detailQnA(Lesson l) {
		return curDao.selectDetailQnA(sqlSession, l);
	}
	@Override
	public int insertQuestion(QnA q) {
		return curDao.insertQuestion(sqlSession, q);
	}
	@Override
	public int updateQuestion(QnA q) {
		return curDao.updateQuestion(sqlSession, q);
	}
	@Override
	public int deleteQuestion(QnA q) {
		return curDao.deleteQuestion(sqlSession, q);
	}
	@Override
	public int insertAnswer(QnA q) {
		return curDao.insertAnswer(sqlSession, q);
	}
	@Override
	public int updateAnswer(QnA q) {
		return curDao.updateAnswer(sqlSession, q);
	}
	@Override
	public int deleteAnswer(QnA q) {
		return curDao.deleteAnswer(sqlSession, q);
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
	@Override
	public int selectAverageStar(Lesson l) {
		return curDao.selectAverageStar(sqlSession, l);
	}
	
	
}
