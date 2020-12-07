package com.kh.ee.user.support.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.notice.model.vo.Notice;

@Repository
public class SupportDao {
	
	//notice 페이지 list 문(성연)
	public int noticeCountList(SqlSessionTemplate ss) {
		return ss.selectOne("supportMapper.selectNoticeListCount");
	}
	public ArrayList<Notice> noticeList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("supportMapper.noticeList",null,rowBounds);
	}
	
	public Notice supportNoticeDetail(SqlSessionTemplate ss, Notice n) {
		return ss.selectOne("supportMapper.supportNoticeDetail", n);
	}
	
	//faq 페이지 select 문(성연)
	public int faqCountList(SqlSessionTemplate ss) {
		return ss.selectOne("supportMapper.selectFaqListCount");
	}
	
	public ArrayList<Faq> faqList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("supportMapper.faqList",null,rowBounds);
	}
	
	public Faq supportFaqDetail(SqlSessionTemplate ss, Faq f) {
		return ss.selectOne("supportMapper.supportFaqDetail", f);
	}
	
	//inq 페이지 select 문(성연)
	public int inqCountList(SqlSessionTemplate ss) {
		return ss.selectOne("supportMapper.selectInqListCount");
	}
	
	public ArrayList<Inquiry> inqList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("supportMapper.inqList",null,rowBounds);
	}

	//inq 상세페이지 select 문(성연)
	public int inqDetailCountList(SqlSessionTemplate ss) {
		return ss.selectOne("supportMapper.selectInqDetailListCount");
	}
	
	public ArrayList<Inquiry> supportInqDetail(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("supportMapper.supportInqDetail",null,rowBounds);
	}

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//inq 작성
	public int insertInq(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.insert("supportMapper.insertInq", i);
	}
	
	
	
	
	
	
	
	
}
