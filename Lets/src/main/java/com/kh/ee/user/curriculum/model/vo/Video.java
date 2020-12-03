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
public class Video {

	private int videoNo;		// 비디오 번호
	private int lessonNo;		// 레슨 번호
	private String videoUrl;	// 영상 주소 (유튜브)
	private String videoCont;	// 영상 간단 소개
	private String videoName;	// 영상 제목
	
}
