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

	public int selectListCount(SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.selectListCount");
	}

	public ArrayList<Member> selectDiscountList(PageInfo pi, SqlSessionTemplate ss) {
			
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)ss.selectList("adminMapper.selectDiscountList",null,rowBounds);
	}

	public int discountSet(Lesson l, SqlSessionTemplate ss) {
		return ss.update("adminMapper.discountSet",l);
	}

	public int searchDiscountCount(SearchCondition sc, SqlSessionTemplate ss) {
		return ss.selectOne("adminMapper.searchDiscountCount",sc);
	}

	public ArrayList<Member> searchDiscountList(SearchCondition sc, PageInfo pi, SqlSessionTemplate ss) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)ss.selectList("adminMapper.searchDiscountList",sc,rowBounds);
	}

}
