package com.kh.ee.user.memPay.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.memPay.model.dao.MemPayDao;
import com.kh.ee.user.memPay.model.vo.MemPay;

@Service
public class MemPayServiceImpl implements MemPayService{

	@Autowired
	private SqlSessionTemplate ss;
	@Autowired
	private MemPayDao memPayDao;
	
	@Override
	public ArrayList<MemPay> selectPrepareList(int memNo, PageInfo pi) {
		return memPayDao.selectPrepareList(ss, memNo, pi);
	}

	@Override
	public int updateDelivery(MemPay mp) {
		return memPayDao.updateDelivery(ss,mp);
	}

	@Override
	public int selectListCount(int memNo) {
		return memPayDao.selectListCount(ss, memNo);
	}

//	@Override
//	public int selectSalaryList(int memNo) {
//		return memPayDao.selectSalaryList(ss,memNo);
//	}

}
