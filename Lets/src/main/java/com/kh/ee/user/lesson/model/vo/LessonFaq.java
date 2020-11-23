package com.kh.ee.user.lesson.model.vo;

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
public class LessonFaq {
	
	private int lessonNo;
	private String faqQuestion;
	private String faqAnswer; 
	

}
