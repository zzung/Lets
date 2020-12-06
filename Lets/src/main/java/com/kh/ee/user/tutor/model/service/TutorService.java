package com.kh.ee.user.tutor.model.service;

import com.kh.ee.user.tutor.model.vo.Tutor;

public interface TutorService {

	// 튜터정보 작성용 서비스 (현선)
	int insertTutorInfo(Tutor t);
	
	// 튜터정보 수정용 서비스(현선)
	Tutor selectTutor(int memNo);
	int updateTutorInfo(Tutor t);

	int getTutorAuth(int memNo);
	

}
