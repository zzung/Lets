package com.kh.ee.user.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Report {

	private int memNo;
	private String nickname;
	private int reportCount;
	
	private int replyNo;
	private Date enrollDate;
	private String replyContent;
	
	private int reportNo;
	private Date reportDate;
	private String reportType;
	private String status; 
	
	
	private int repCount;
	
	
}
