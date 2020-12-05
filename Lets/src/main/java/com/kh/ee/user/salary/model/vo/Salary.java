package com.kh.ee.user.salary.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Salary {

	private int lessonNo;
	private int fee;
	private int salaryTotal;
	private String account;
	private Date salaryDate;
	
	private String bankName;
	private String accountNo;
	
	private ArrayList<Salary> salaryList;
	private ArrayList<Integer> lsno;
}
