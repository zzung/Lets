package com.kh.ee.user.notice.model.service;

import java.util.ArrayList;

import com.kh.ee.user.notice.model.vo.Notice;

public interface NoticeService {
	
	ArrayList<Notice> selectNoticeList(Notice n);
	

}
