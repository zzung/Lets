package com.kh.ee.user.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.review.model.service.ReviewService;
import com.kh.ee.user.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService revService;
	
	//후기 더보기 플러스 버튼 클릭시 적용
	@RequestMapping("showMore.rev")
	public String showMoreReview(HttpSession session, Model model) {
		ArrayList<Review> list = revService.showMoreReview(); 
		
		model.addAttribute("list",list);
		
		return "user/lesson/reviewDetail";
	}
	
	@RequestMapping("deleteReview.rev")
	public String deleteReview(int reviewNo) {
		int result = revService.deleteReview(reviewNo);
		
		return "redirect:showMore.rev";
	}


}
