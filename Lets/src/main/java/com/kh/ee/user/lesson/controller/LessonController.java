package com.kh.ee.user.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.review.model.service.ReviewService;
import com.kh.ee.user.review.model.vo.Review;

@Controller
public class LessonController {
	
	@Autowired
	private LessonService lService;
	private ReviewService revService; 

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
		ArrayList<Review> list = revService.selectReview(lessonNo); 
		System.out.println("lessonNo:" + lessonNo);
		
		model.addAttribute("list", list); 		
		return "user/lesson/classDetailView"; 
	}

		
	
}
