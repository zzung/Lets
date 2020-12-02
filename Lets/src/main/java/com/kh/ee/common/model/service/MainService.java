package com.kh.ee.common.model.service;

import java.util.ArrayList;

import com.kh.ee.user.lesson.model.vo.Lesson;

public interface MainService {

	//메인페이지 상단 썸네일 
	ArrayList<Lesson> mainThumbnail();

	ArrayList<Lesson> kidsList();

	ArrayList<Lesson> moneyList();

	ArrayList<Lesson> hobbyList();

	ArrayList<Lesson> careerList();

	ArrayList<Lesson> newLessonList();

}
