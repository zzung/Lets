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
public class Curriculum {

	private int curriculumNo;
	private String curriculumCont;
	private int lessonNo;
	private int refCurNo;
	private int curLevel;
	
}
