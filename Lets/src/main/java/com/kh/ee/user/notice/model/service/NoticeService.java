package com.kh.ee.user.notice.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.notice.model.vo.Notice;

public interface NoticeService {
	
	ArrayList<Notice> selectNoticeList(Notice n);
	
	// 튜터 공지사항 게시판 서비스
	int tutorSelectNoticeListCount(Notice n);
	ArrayList<Notice> tutorSelectNoticeList(Notice n, PageInfo pi);		// 페이징 처리
	
	// 튜터 공지사항 상세보기 서비스
	Notice tutorDetailNotice(Notice n);
	
	// 공지사항 조회 수 증가 서비스
	int increaseCount(Notice n);

}
