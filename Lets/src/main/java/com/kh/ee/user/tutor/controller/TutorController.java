package com.kh.ee.user.tutor.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.faq.model.service.FaqService;
import com.kh.ee.user.faq.model.vo.Faq;

@Controller
public class TutorController {
	@Autowired
	private FaqService faqService;
	
	@RequestMapping("tutorMain.tm")
	public String tutorMain(Faq f, Model model) {
		
		ArrayList<Faq> list = faqService.selectTutorFaqList(f);
		
		model.addAttribute("list",list);
		return "user/tutor/tutorMainView";
	}
	
	@RequestMapping("myClass.tm")
	public String myClass() {
		return "user/tutor/myClassView";
	}
	
	@RequestMapping("tutorEnroll.te")
	public String insertFormTutor() {
		return "user/tutor/tutorEnrollForm";
	}
}
