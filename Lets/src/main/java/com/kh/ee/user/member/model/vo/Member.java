package com.kh.ee.user.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickname;
	private String birthday;
	private String gender;
	private String postcode;
	private String postAddress;
	private String detailAddress;
	private String extraAddress;
	private String phone;
	private String memPic;
	private Date enrollDate;
	private Date modifyDate;
	private int reportCount;
	private Date outDate;
	private String status; 
	
	//학천 admin에서 사용
	private String lessonTitle;
}
