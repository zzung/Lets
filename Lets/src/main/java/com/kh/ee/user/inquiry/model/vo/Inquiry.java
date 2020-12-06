package com.kh.ee.user.inquiry.model.vo;

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
public class Inquiry {

	private int inqNo;
	private int memNo;
	private String inqTitle;
	private String inqContent;
	private String inqType;
	private Date enrollDate;
	private Date answerDate;
	private String answerContent;
	private String inqFile;
	private String originFile;
	private String typeStatus;
	private String status;
	private String reStatus;
	
	private String nickname;

}
