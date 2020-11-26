package com.kh.ee.user.reply.model.vo;

import java.sql.Date;

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
public class Reply {

	private int replyNo;
	private int memNo;
	private String replyContent;
	private Date replyEnrollDate;
	private Date replyModifyDate;
	private String status;
	private int replyNo2;
	private String replyType;
	private int replyLevel;
	private int totalNo;
	private int repCount; 
}
