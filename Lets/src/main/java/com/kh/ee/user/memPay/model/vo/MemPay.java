package com.kh.ee.user.memPay.model.vo;

import java.sql.Date;

import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

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
public class MemPay {
	
	private int memPayNo;
	private int memNo;
	private int lessonNo;
	private String type;
	private String repayment;
	private Date paymentDate;
	private Date cancelDate;
	private String status;
	private String delName;
	private String delNo;
	private String delStatus;
	private String delPostcode;
	private String delPostAdr;
	private String delDetailAdr;
	private String delExtraAdr;
	
	private String lessonTitle;
	private String memId;
	private String lessonCoverImg;
	private String lessonPrepare;
	private String payTotal;		// 클래스 금액
	private String discountPrice; 	// 할인 금액
	private String totalAmount;		// 클래스 금액-할인 금액
	private String memName;
	private String postcode;
	private String postAddress;
	private String detailAddress;
	private String extraAddress;
	private String phone;
	private String lessonType;

}
