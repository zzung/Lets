package com.kh.ee.user.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.review.model.vo.Review;

@Controller
public class LessonController {
	
	@Autowired
	private LessonService lService;

	@RequestMapping("kids.le")
	public String kidsCurriculum() {
		return "user/lesson/kidsCurriculumListView";
	}
	
	@RequestMapping("money.le")
	public String moneyCurriculum() {
		return "user/lesson/moneyCurriculumListView";
	}	
	
	@RequestMapping("career.le")
	public String careerCurriculum() {
		return "user/lesson/careerCurriculumListView";
	}	
	
	@RequestMapping("hobby.le")
	public String hobbyCurriculum() {
		return "user/lesson/hobbyCurriculumListView";
	}	
	
	@RequestMapping("preview.le")
	public String previewLesson() {
		return "user/lesson/previewLesson";
	}
	
	@RequestMapping("payClass.le")
	public String paymentDetail() {
		return"user/lesson/paymentDetailView";
	}
	
	//상세페이지에서 보여질 후기 부분 부터 작성.(학천)
	@RequestMapping("courseDetailView.le")
	public String courseDetailView(int lessonNo, HttpSession session, Model model) {
		ArrayList<Review> list = lService.selectReview(lessonNo); 
		ArrayList<LessonFaq> faqList = lService.selectLessonFaqList(lessonNo); 
		
		model.addAttribute("list", list); 
		model.addAttribute("faqList",faqList);
		return "user/lesson/classDetailView"; 
	}
	
	@RequestMapping("enroll.le")
	public String enrollLesson() {
		return "user/lesson/lessonEnrollForm";
	}
		
	
}
