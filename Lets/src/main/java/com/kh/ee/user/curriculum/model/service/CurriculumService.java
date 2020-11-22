package com.kh.ee.user.curriculum.model.service;

import java.util.ArrayList;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.LessonFAQ;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;

public interface CurriculumService {

	Lesson selectLesson(Lesson l);
	QnA selectQnA(Lesson l);
	ArrayList<Curriculum> selectCurriculum(Lesson l);
	Lesson detailLessonInfo(Lesson l);
	ArrayList<LessonFAQ> detailFAQ(Lesson l);
	ArrayList<QnA> detailQnA(Lesson l);
	int insertQuestion(QnA q);
	int updateQuestion(QnA q);
	int deleteQuestion(QnA q);
	int insertAnswer(QnA q);
	int updateAnswer(QnA q);
	int deleteAnswer(QnA q);
	ArrayList<Video> videoList(Video v);
	Video detailVideo(Video v);
	int updateVideoStatus(MemVideo mv);
	
}
