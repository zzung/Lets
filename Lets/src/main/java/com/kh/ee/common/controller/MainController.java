package com.kh.ee.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ee.common.model.service.MainService;
import com.kh.ee.user.lesson.model.vo.Lesson;

@Controller
public class MainController {

	@Autowired
	private MainService ms;
	
	@RequestMapping("mainPage.le")
	public String kidsList(Model model) {
		ArrayList<Lesson> list = ms.mainThumbnail();
		ArrayList<Lesson> kids = ms.kidsList();
		ArrayList<Lesson> money = ms.moneyList();
		ArrayList<Lesson> hobby = ms.hobbyList();
		ArrayList<Lesson> career = ms.careerList(); 
		ArrayList<Lesson> nl = ms.newLessonList();
		
		model.addAttribute("list",list);
		model.addAttribute("kids",kids);
		model.addAttribute("money",money);
		model.addAttribute("hobby",hobby);
		model.addAttribute("career",career);
		model.addAttribute("nl",nl);
		
		return "mainPage";
	}
	
	@RequestMapping("search.le")
	public String searchForm(String search, Model model) {
		
		ArrayList<Lesson> lessonList = ms.searchLessonList(search);
		ArrayList<Lesson> tutorList = ms.searchTutorList(search);
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("tutorList", tutorList);
		
		return "user/coomon/searchResultView";
	}
}
