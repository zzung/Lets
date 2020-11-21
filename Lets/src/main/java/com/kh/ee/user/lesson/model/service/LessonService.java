package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;

import com.kh.ee.user.lesson.model.vo.Lesson;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList(Lesson l);
	
	ArrayList<Lesson> selectApproveStatusList(Lesson l);
	
	ArrayList<Lesson> selectPrepareList(Lesson l);
	

}
