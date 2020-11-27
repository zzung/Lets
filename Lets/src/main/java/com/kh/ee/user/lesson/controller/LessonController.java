package com.kh.ee.user.lesson.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.common.template.Pagination;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

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
	public String courseDetailView(int lessonNo, Model model) {
		ArrayList<Review> list = lService.selectReview(lessonNo); 
		ArrayList<LessonFaq> faqList = lService.selectLessonFaqList(lessonNo); 
		Tutor t = lService.selectTutorInfo(lessonNo); 
				
		model.addAttribute("list", list); 
		model.addAttribute("faqList",faqList);
		model.addAttribute("t", t);
		return "user/lesson/classDetailView"; 
	}
	
	@ResponseBody
	@RequestMapping(value="selectReplyList.le", produces="application/json; charset=utf-8")
	public String selectReplyList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, int lessonNo, Model model) {
		
		
		int listCount = lService.selectListCount(); 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Reply> list = lService.selectReply(pi,lessonNo); 
		
		model.addAttribute("pi",pi); 
		return new Gson().toJson(list);
	}
	
	@RequestMapping("enroll.le")
	public String enrollLesson() {
		return "user/lesson/lessonEnrollForm";
	}
		
	
}
