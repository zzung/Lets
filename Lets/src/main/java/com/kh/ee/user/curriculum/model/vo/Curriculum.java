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

	private int curriculumNo;			// 커리큘럼 번호
	private String curriculumCont;		// 커리큘럼 내용
	private int lessonNo;				// 레슨 번호
	private int refCurNo;				// 참조하는 커리큘럼 번호
	private int curLevel;				// 커리큘럼 레벨
	private int videoNo;				// 비디오 번호
	
}
