package com.kh.ee.user.curriculum.model.vo;

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
public class LessonFAQ {

	private int lessonNo;
	private String faqQuestion;
	private String faqAnswer;
	
}
