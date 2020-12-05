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
	private int replyNo;
	private String reportType;
	private Date reportDate;
	private String status; 
	
	private String nickname;
	private int repCount;
	private String replyContent;
	
	
}
