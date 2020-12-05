package com.kh.ee.user.salary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.salary.model.vo.Salary;

@Repository
public class SalaryDao {

	public int insertSalary(Salary s, SqlSessionTemplate ss) {

		return ss.insert("salaryMapper.insertSalary",s);
		
	}
	
}
