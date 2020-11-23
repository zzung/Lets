package com.kh.ee.user.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int noticeNo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
}
