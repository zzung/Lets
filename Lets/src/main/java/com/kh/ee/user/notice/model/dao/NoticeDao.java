package com.kh.ee.user.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate ss, Notice n) {
		return (ArrayList)ss.selectList("noticeMapper.selectNoticeList", n);
	}
	
	public int tutorSelectNoticeListCount(SqlSessionTemplate ss, Notice n) {
		return ss.selectOne("noticeMapper.tutorSelectNoticeListCount", n);
	}

	public ArrayList<Notice> tutorSelectNoticeList(SqlSessionTemplate ss, Notice n, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)ss.selectList("noticeMapper.tutorSelectNoticeList", n, rowBounds);
	}
	
	public Notice tutorDetailNotice(SqlSessionTemplate ss, Notice n) {
		return ss.selectOne("noticeMapper.tutorDetailNotice", n);
	}
	
	public int increaseCount(SqlSessionTemplate ss, Notice n) {
		return ss.update("noticeMapper.increaseCount", n);
	}
}
