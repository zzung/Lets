package com.kh.ee.user.curriculum.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemVideo {

	private int videoNo;		// 비디오 번호
	private int memNo;			// 회원 번호
	private String status;		// 영상 시청 여부

	private int preVideoNo;		// 이전 영상 번호
	private int nextVideoNo;	// 다음 영상 번호
	
}
