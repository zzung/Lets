package com.kh.ee.user.memPay.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.memPay.model.vo.MemPay;

@Repository
public class MemPayDao {
	
	public ArrayList<MemPay> selectPrepareList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("memPayMapper.selectPrepareList");
	}

}
