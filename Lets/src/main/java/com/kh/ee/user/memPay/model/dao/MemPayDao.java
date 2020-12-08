package com.kh.ee.user.memPay.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.memPay.model.vo.MemPay;

@Repository
public class MemPayDao {
	
	public ArrayList<MemPay> selectPrepareList(SqlSessionTemplate ss, int memNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)ss.selectList("memPayMapper.selectPrepareList", memNo, rowBounds);
	}
	
	public int updateDelivery(SqlSessionTemplate ss, MemPay mp) {
		return ss.update("memPayMapper.updateDelivery", mp);
	}
	
	public int selectListCount(SqlSessionTemplate ss, int memNo) {
		return ss.selectOne("memPayMapper.selectListCount", memNo);
	}

	public ArrayList<MemPay> selectSalaryList(SqlSessionTemplate ss, int memNo) {
		return (ArrayList)ss.selectList("memPayMapper.selectSalaryList", memNo);
	}
}
