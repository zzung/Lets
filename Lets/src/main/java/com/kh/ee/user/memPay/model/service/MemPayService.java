package com.kh.ee.user.memPay.model.service;

import java.util.ArrayList;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.memPay.model.vo.MemPay;

public interface MemPayService {

	ArrayList<MemPay> selectPrepareList(int memNo, PageInfo pi);
	int updateDelivery(MemPay mp);
	int selectListCount(int memNo);
	ArrayList<MemPay> selectSalaryList(int memNo);
	
}
