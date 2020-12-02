package com.kh.ee.admin.model.vo;

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
public class SearchCondition {

	private String writer;
	private String title;
	private String content;
	private String percentage;
	private String approval;
}
