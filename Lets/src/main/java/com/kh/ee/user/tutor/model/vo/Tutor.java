package com.kh.ee.user.tutor.model.vo;

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
public class Tutor {

	private int memNo;
	private String tutorPic;
	private String tutorInfo;
	private Date modifyDate;
	private String status;
	
}
