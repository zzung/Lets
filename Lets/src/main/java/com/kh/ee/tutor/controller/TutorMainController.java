package com.kh.ee.tutor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TutorMainController {
	
	@RequestMapping("tutorMain.tm")
	public String tutorMain() {
		return "tutor/tutorMainView";
	}
}
