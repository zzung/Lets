package com.kh.ee.user.lesson.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.Video;

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
public class Lesson {

	private int lessonNo;
	private int memNo;
	private String lessonForm;
	private String lessonType;
	private int lessonGroup;
	private String lessonCategory;
	private String lessonTitle;
	private String lessonCoverImg;
	private String lessonInstr;
	private int lessonContNo;
	private String lessonPrepare;
	private String lessonTarget;
	private int likeCount;
	private String lessonStatus;
	private int statusHold;
	private String holdReason;
	private String refuseReason;
	private String price;
	private String time;
	private String totalCount;
	private String period;
	private String discStatus;
	private String discountPeriod;
	private String discount;
	private String payTotal;
	private String status;
	private Date approveDate;
	
	//관리자 필요(학천)
	private String memId;
	private int star;
	private Date paymentDate;
	private String payStatus;
	private String endDate;
	private double calPercentage; 
	
	private ArrayList<Video> videoList;
	private ArrayList<LessonFaq> lessonFaqList;
	private ArrayList<String> lessonPrepareList;
	private ArrayList<Curriculum> curriculumList;
	private String CurriculumListNo;
}
