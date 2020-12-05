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

	private int qnaNo;				// qna 번호
	private int memNo;				// 회원 번호
	private int lessonNo;			// 레슨 번호
	private String question;		// 질문
	private String answer;			// 답변
	private String questionEnrollDate;		// 질문 작성일
	private String answerEnrollDate;		// 답변 작성일
	private String questionStatus;			// 질문 삭제 여부
	private String answerStatus;			// 답변 삭제 여부
	
	private String memPic;			// 질문자 사진
	private String tutorPic; 		// 답변자 사진(튜터 사진)
	private int tutorNo;			// 튜터 번호
	private String memNick;			// 회원 닉네임
	private String tutorNick;		// 튜터 닉네임
	private int rnum;				// 순서
}
