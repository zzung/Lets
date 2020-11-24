package com.kh.ee.user.memPay.model.service;

import java.util.ArrayList;

import com.kh.ee.user.memPay.model.vo.MemPay;

public interface MemPayService {

	ArrayList<MemPay> selectPrepareList(MemPay mp);
}
