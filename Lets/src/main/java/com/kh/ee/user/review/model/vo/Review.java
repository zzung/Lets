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
	private Date enrollDate;
	private Date modifyDate;
	private String status; 
	
	//조인 필요해서 해둠(학천)
	private String nickname;
	private String memPic; 
	
}
