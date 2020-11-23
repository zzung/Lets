package com.kh.ee.user.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate ss, Notice n) {
		return (ArrayList)ss.selectList("noticeMapper.selectNoticeList", n);
	}
	

}
