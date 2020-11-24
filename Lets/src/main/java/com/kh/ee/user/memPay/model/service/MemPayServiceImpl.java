package com.kh.ee.user.memPay.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.memPay.model.dao.MemPayDao;
import com.kh.ee.user.memPay.model.vo.MemPay;

@Service
public class MemPayServiceImpl implements MemPayService{

	@Autowired
	private SqlSessionTemplate ss;
	@Autowired
	private MemPayDao memPayDao;
	
	@Override
	public ArrayList<MemPay> selectPrepareList(MemPay mp) {
		return memPayDao.selectPrepareList(ss, mp);
	}

}
