package com.kh.ee.user.curriculum.model.service;

import java.util.ArrayList;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;

public interface CurriculumService {

	// 레슨 객체 조회
	Lesson selectLesson(Lesson l);
	// qna 객체 조회
	QnA selectQnA(Lesson l);
	// 커리큘럼 리스트 조회
	ArrayList<Curriculum> selectCurriculum(Lesson l);
	
	Lesson detailLessonInfo(Lesson l);
	
	ArrayList<LessonFaq> detailFAQ(Lesson l);
	// QnA 서비스
	ArrayList<QnA> detailQnA(Lesson l);
	// QnA 서비스 ajax
	int insertQuestion(QnA q);
	int updateQuestion(QnA q);
	int deleteQuestion(QnA q);
	int insertAnswer(QnA q);
	int updateAnswer(QnA q);
	int deleteAnswer(QnA q);
	
	ArrayList<Video> videoList(Video v);
	// 영상 시청용 서비스
	Video detailVideo(Video v);
	// 영상 시청 시 비디오 상태값 변경
	int updateVideoStatus(MemVideo mv);
	// 시청한 영상수 조회
	int selectVideoCount(Lesson l);
	// 평균 별점 조회
	int selectAverageStar(Lesson l);
	
}
