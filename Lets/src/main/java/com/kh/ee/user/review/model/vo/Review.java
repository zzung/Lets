package com.kh.ee.user.review.model.vo;

import java.sql.Date;

import com.kh.ee.user.member.model.vo.Member;

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
public class Review {

	private int reviewNo;
	private int lessonNo;
	private int memNo;
	private int star;
	private String reviewContent;
	private Date reviewEnrollDate;
	private Date reviewModifyDate;
	private String status; 
	
	//조인 필요해서 해둠(학천)
	private String nickname;
	private String memPic; 
	
	private int replyNo;
	private String replyContent;
	private int replyLevel; 
	private Date replyEnrollDate; 
	private int totalNo;
	private String replyType;
}
