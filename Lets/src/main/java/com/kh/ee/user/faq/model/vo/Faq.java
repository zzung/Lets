package com.kh.ee.user.faq.model.vo;

import java.sql.Date;

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
public class Faq {
	
	private int faqNo;
	private String faqCategory;
	private String faqStatus;
	private Date EnrollDate;
	private String faqType;
	private String faqTitle;
	private String faqContent;

}
