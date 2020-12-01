package com.kh.ee.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

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
	public int rejectApproval(int lessonNo, SqlSessionTemplate ss) {
		return ss.update("adminMapper.rejectApproval",lessonNo);
	}

}
