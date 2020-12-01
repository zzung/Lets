package com.kh.ee.user.memPay.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.memPay.model.vo.MemPay;

@Repository
public class MemPayDao {
	
	public ArrayList<MemPay> selectPrepareList(SqlSessionTemplate ss, int memNo) {
		return (ArrayList)ss.selectList("memPayMapper.selectPrepareList", memNo);
	}
	
	public int updateDelivery(SqlSessionTemplate ss, MemPay mp) {
		return ss.update("memPayMapper.updateDelivery", mp);
	}
	
	public int selectListCount(SqlSessionTemplate ss, int memNo) {
		return ss.selectOne("memPayMapper.selectListCount", memNo);
	}

}
