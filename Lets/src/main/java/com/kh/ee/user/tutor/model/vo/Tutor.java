package com.kh.ee.user.tutor.model.vo;

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
	private String modifyDate;
	private String status;
	
	// 조인 필요해서 해 둠(학천)
	private String nickname; 
	
}
