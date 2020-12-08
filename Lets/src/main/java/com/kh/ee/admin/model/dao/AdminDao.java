package com.kh.ee.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.report.model.vo.Report;

@Repository
public class AdminDao {
	
	//할인 품관리 총 list(학천)
	public int selectListCount(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectListCount");
	}
	public ArrayList<Member> selectDiscountList(PageInfo pi, SqlSessionTemplate ss) {
			
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)ss.selectList("adminMapper.selectDiscountList",null,rowBounds);
	}

	//ajax(학천)할인율 셋팅
	public int discountSet(Lesson l, SqlSessionTemplate ss) {
		return ss.update("adminMapper.discountSet",l);
	}
	
	//할인 품관리 총 list(학천)
	public int searchDiscountCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchDiscountCount",sc);
	}
	public ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)ss.selectList("adminMapper.searchDiscountList",sc,rowBounds);
	}

	//할인 미적용 카운트용(학천)
	public int countDiscountUnApplied(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.countDiscountUnApplied");
	}
	public ArrayList<Member> searchDiscountUnApplied(PageInfo pi, SqlSessionTemplate ss) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchDiscountUnApplied",null,rowBounds);
	}
	
	//할인 적용 카운트 / 검색(학천)
	public int countDiscountApplied(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.countDiscountApplied");
	}
	public ArrayList<Member> countDiscountApplied(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchDiscountApplied",null,rowBounds);
	}
	
	//클래스 관리 페이지 select 문(학천)
	public int classMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectListCount");
	}
	public ArrayList<Lesson> classMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.classMgmtList",null,rowBounds);
	}
	
	//클래스관리 승인 처리 ajax(학천)
	public int lessonApproval(int lessonNo, SqlSessionTemplate ss) {
		return ss.update("adminMapper.lessonApproval",lessonNo);
	}
	
	//클래스관리 거절 처리 ajax(학천)
	public int rejectApproval(Lesson l, SqlSessionTemplate ss) {
		return ss.update("adminMapper.rejectApproval",l);
	}
	
	//클래스관리 검색시 나올 갯수/검색(학천)
	public int searchClassMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchClassMgmtCount",sc);
	}
	public ArrayList<Lesson> searchClassMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchClassMgmtList",sc,rowBounds);
	}
	
	//클래스결제 전체 list(학천)
	public int classPaymentListCount(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.classPaymentListCount");
	}
	public ArrayList<MemPay> classPaymentList(PageInfo pi, SqlSessionTemplate ss) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit); 		
		return (ArrayList)ss.selectList("adminMapper.classPaymentList",null,rowBounds);
	}
	
	//클래스결제 결제취소(학천)ajax
	public int cancelPay(int memPayNo, SqlSessionTemplate ss) {
		return ss.update("adminMapper.cancelPay",memPayNo);
	}
	
	//클래스 결제 검색(학천)
	public int searchPaymentMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchPaymentMgmtCount",sc);
	}
	public ArrayList<MemPay> searchPaymentMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit); 		
		return (ArrayList)ss.selectList("adminMapper.searchPaymentMgmtList",sc,rowBounds);
	}
	
	///////////////
	
	
	//회원 관리 페이지 select 문(성연)
	public int memberMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectMemListCount");
	}
	public ArrayList<Member> memberMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.memberMgmtList",null,rowBounds);
	}
	
	//회원관리 검색시 나올 갯수/검색
	public int searchMemberMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchMemberMgmtCount",sc);
	}
	public ArrayList<Member> searchMemberMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchMemberMgmtList",sc,rowBounds);
	}
	
	//블랙 관리 페이지 select 문(성연)
	public int blacklistMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectBlacklistListCount");
	}
	public ArrayList<Member> blacklistMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.blacklistMgmtList",null,rowBounds);
	}
	
	//블랙리스트 관리 검색시 나올 갯수/검색
	public int searchBlacklistMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchBlacklistMgmtCount",sc);
	}
	public ArrayList<Member> searchBlacklistMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchBlacklistMgmtList",sc,rowBounds);
	}
		
	
	//1:1 문의 관리 페이지 (성연)
	public int inquiryMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectInquiryListCount");
	}
	public ArrayList<Inquiry> inquiryMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.inquiryMgmtList",null,rowBounds);
	}
	
	//문의 관리 검색시 나올 갯수/검색
	public int searchInquiryMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchInquiryMgmtCount",sc);
	}
	public ArrayList<Inquiry> searchInquiryMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchInquiryMgmtList",sc,rowBounds);
	}
	
	//문의 답변 작성
	public int inqAnswer(Inquiry i, SqlSessionTemplate ss) {
		return ss.update("adminMapper.inqAnswer", i);
	}
	
	//신고 관리 페이지 select 문(성연)
	public int reportMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectReportListCount");
	}
	public ArrayList<Report> reportMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.reportMgmtList",null,rowBounds);
	}
	
	//신고 관리 검색시 나올 갯수/검색
	public int searchReportMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchReportMgmtCount",sc);
	}
	public ArrayList<Report> searchReportMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchReportMgmtList",sc,rowBounds);
	}
		
	//공지사항 관리 페이지 select 문(성연)
	public int noticeMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectNoticeListCount");
	}
	public ArrayList<Notice> noticeMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.noticeMgmtList",null,rowBounds);
	}

	//신고 관리 검색시 나올 갯수/검색
	public int searchNoticeMgmtCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchNoticeMgmtCount",sc);
	}
	public ArrayList<Notice> searchNoticeMgmtList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.searchNoticeMgmtList",sc,rowBounds);
	}
	
	//공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertNotice", n);
	}
		
	//faq 관리 페이지 select 문(성연)
	public int faqMgmtCountList(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectFaqListCount");
	}
	public ArrayList<Faq> faqMgmtList(PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)ss.selectList("adminMapper.faqMgmtList",null,rowBounds);
	}
	
	//FAQ 작성
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("adminMapper.insertFaq", f);
	}
	

}
