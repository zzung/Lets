package com.kh.ee.user.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.notice.model.dao.NoticeDao;
import com.kh.ee.user.notice.model.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public ArrayList<Notice> selectApproveLessonList(Notice n) {
		return nDao.selectApproveLessonList(ss, n);
	}

	@Override
	public ArrayList<Notice> selectApproveStatusList(Notice n) {
		return nDao.selectApproveStatusList(ss, n);
	}

	@Override
	public ArrayList<Notice> selectPrepareList(Notice n) {
		return nDao.selectPrepareList(ss, n);
	}
	
	
}
