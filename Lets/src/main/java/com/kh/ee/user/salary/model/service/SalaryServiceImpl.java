package com.kh.ee.user.salary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.salary.model.dao.SalaryDao;
import com.kh.ee.user.salary.model.vo.Salary;

@Service
public class SalaryServiceImpl implements SalaryService{

	@Autowired
	private SqlSessionTemplate ss;
	@Autowired
	private SalaryDao salaryDao;
	
	@Override
	public int insertSalary(Salary s) {
		return salaryDao.insertSalary(s, ss);
	}
	

}
