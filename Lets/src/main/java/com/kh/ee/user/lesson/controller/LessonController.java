package com.kh.ee.user.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.report.model.vo.Report;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Controller
public class LessonController {
	
	@Autowired
	private LessonService lService;

	@RequestMapping("kids.le")
	public String kidsCurriculum(Model model) {
		ArrayList<Lesson> pop = lService.selectKidsPop();
		ArrayList<Lesson> nl = lService.selectKidsNew();
		ArrayList<Lesson> disc = lService.selectKidsDisc();
		ArrayList<Lesson> all = lService.selectKidsAll();
		
		model.addAttribute("pop",pop);
		model.addAttribute("nl",nl);
		model.addAttribute("disc",disc);
		model.addAttribute("all",all);
		
		return "user/lesson/kidsCurriculumListView";
	}
	
	@RequestMapping("money.le")
	public String moneyCurriculum(Model model) {
		ArrayList<Lesson> pop = lService.selectMoneyPop();
		ArrayList<Lesson> nl = lService.selectMoneyNew();
		ArrayList<Lesson> disc = lService.selectMoneyDisc();
		ArrayList<Lesson> all = lService.selectMoneyAll();
		
		model.addAttribute("pop",pop);
		model.addAttribute("nl",nl);
		model.addAttribute("disc",disc);
		model.addAttribute("all",all);
		
		return "user/lesson/moneyCurriculumListView";
	}	
	
	@RequestMapping("career.le")
	public String careerCurriculum(Model model) {
		ArrayList<Lesson> pop = lService.selectCareerPop();
		ArrayList<Lesson> nl = lService.selectCareerNew();
		ArrayList<Lesson> disc = lService.selectCareerDisc();
		ArrayList<Lesson> all = lService.selectCareerAll();
		
		model.addAttribute("pop",pop);
		model.addAttribute("nl",nl);
		model.addAttribute("disc",disc);
		model.addAttribute("all",all);
		return "user/lesson/careerCurriculumListView";
	}	
	
	@RequestMapping("hobby.le")
	public String hobbyCurriculum(Model model) {
		ArrayList<Lesson> pop = lService.selectHobbyPop();
		ArrayList<Lesson> nl = lService.selectHobbyNew();
		ArrayList<Lesson> disc = lService.selectHobbyDisc();
		ArrayList<Lesson> all = lService.selectHobbyAll();
		
		model.addAttribute("pop",pop);
		model.addAttribute("nl",nl);
		model.addAttribute("disc",disc);
		model.addAttribute("all",all);
		return "user/lesson/hobbyCurriculumListView";
	}	
	
	@RequestMapping("preview.le")
	public String previewLesson() {
		return "user/lesson/previewLesson";
	}
	
	@RequestMapping("payClass.le")
	public String selectLessonList(int lessonNo, Model model) {
		Lesson lesson = lService.selectLessonList(lessonNo);
		
		model.addAttribute("l",lesson);
		return"user/lesson/paymentDetailView";
	}
	
	//상세페이지에서 보여질 후기 부분 부터 작성.(학천)
	@RequestMapping("courseDetailView.le")
	public String courseDetailView(int lessonNo, HttpSession session, Model model) {
		Lesson lesson = lService.selectLessonList(lessonNo); 
		ArrayList<Review> list = lService.selectReview(lessonNo); 
		ArrayList<LessonFaq> faqList = lService.selectLessonFaqList(lessonNo); 
		Tutor t = lService.selectTutorInfo(lessonNo); 
		int listCount = lService.selectListCount(); 
		MemPay mp = lService.selectMemPayList(lessonNo); 
				
		model.addAttribute("list", list); 
		model.addAttribute("faqList",faqList);
		model.addAttribute("t", t);
		model.addAttribute("listCount",listCount);
		model.addAttribute("l",lesson); 
		model.addAttribute("mp",mp);
		return "user/lesson/classDetailView"; 
	}
	
	//상세페이지 커뮤니니티(학천)
	@ResponseBody
	@RequestMapping(value="selectReplyList.le", produces="application/json; charset=utf-8")
	public String selectReplyList(int lessonNo) {
		ArrayList<Reply> list = lService.selectReply(lessonNo); 

		return new Gson().toJson(list);
	}
	
	//상세페이지 커뮤니니티(학천)
	@ResponseBody
	@RequestMapping("insertReply.le")
	public String insertReply(Reply r) {
		int result = lService.insertReply(r);
		
		if(result>0) {
			return "success";
		}else {
			return "fail"; 
		}
	}
	
	//커뮤니티 댓글 삭제(학천)
	@ResponseBody
	@RequestMapping("deleteReply.le")
	public String deleteReply(int replyNo) {
		int result = lService.deleteReply(replyNo);
		
		if(result>0) {
			return "success";
		} else {
			return "fail"; 
		}
	}
	
	@ResponseBody
	@RequestMapping("updateReply.le")
	public String updateReply(Reply r) {
		int result = lService.updateReply(r);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("reReply.le")
	public String insertReReply(Reply r) {
		int result = lService.insertReReply(r);
		
		if(result>0) {
			return "success";
		} else {
			return "fail"; 
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteReReply.le")
	public String deleteReReply(Reply r) {
		int result = lService.deleteReReply(r);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateReReply.le")
	public String updateReReply(Reply r) {
		int result = lService.updateReReply(r);
		
		if(result>0) {
			return "success";
		} else {
			return "fail"; 
		}
	}
	
	@ResponseBody
	@RequestMapping("reportReply.le")
	public String reportReply(Report rpt) {
		int result = lService.reportReply(rpt);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	/*
	@ResponseBody
	@RequestMapping("likeCount.le")
	public String likeCount(int lessonNo) {
		int result = lService.likeCount(lessonNo);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	*/
	
	@RequestMapping("enroll.le")
	public String enrollLesson() {
		return "user/lesson/lessonEnrollForm";
	}
		
	@RequestMapping("enrollNext.le")
	public String enrollNextLesson() {
		return "user/lesson/lessonEnrollNextForm";
	}
	
	//결제정보 작성해서 보내기(학천)
	@RequestMapping("paymentProcess.le")
	public void paymentProcess() {
		
	}
}
