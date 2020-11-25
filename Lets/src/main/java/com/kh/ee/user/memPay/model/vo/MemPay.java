package com.kh.ee.user.memPay.model.vo;

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
	private String memId;
	

}
