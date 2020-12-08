package com.kh.ee.admin.model.vo;

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
public class SearchCondition {

	private String writer;
	private String title;
	private String payment;
	private String percentage;
	private String approval;
	
	private String memName;
	private String nickname;
	private String memId;
	
	private String inqType;
	private String inqTitle;
	
	private String reportType;
	private String status;
	
	private String noticeType;
	private String noticeTitle;
	
	private String faqCategory;
	private String faqStatus;
	private String faqTitle;
	
}
