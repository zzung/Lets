package com.kh.ee.user.curriculum.model.vo;

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
public class QnA {

	private int qnaNo;
	private int memNo;
	private int lessonNo;
	private String question;
	private String answer;
	private Date qEnrollDate;
	private Date aEnrollDate;
	private String qStatus;
	private String aStatus;
	
}
