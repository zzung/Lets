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

	private int qnaNo;			// qna 번호
	private int memNo;			// 회원 번호
	private int lessonNo;		// 레슨 번호
	private String question;	// 질문
	private String answer;		// 답변
	private Date qEnrollDate;	// 질문 작성일
	private Date aEnrollDate;	// 답변 작성일
	private String qStatus;		// 질문 삭제 여부
	private String aStatus;		// 답변 삭제 여부
	
}
