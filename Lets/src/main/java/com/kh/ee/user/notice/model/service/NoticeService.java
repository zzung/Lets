package com.kh.ee.user.notice.model.service;

import java.util.ArrayList;

import com.kh.ee.user.notice.model.vo.Notice;

public interface NoticeService {
	
	ArrayList<Notice> selectApproveLessonList(Notice n);
	
	ArrayList<Notice> selectApproveStatusList(Notice n);
	
	ArrayList<Notice> selectPrepareList(Notice n);
	

}
