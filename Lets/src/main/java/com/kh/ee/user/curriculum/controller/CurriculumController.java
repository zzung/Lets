package com.kh.ee.user.curriculum.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.curriculum.model.service.CurriculumService;
import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class CurriculumController {

	@Autowired
	private CurriculumService curService;
	
	@RequestMapping("detailCurri.cr")
	public String detailCurriculum(Lesson l, HttpSession session, Model model) {
		
		// 로그인한 회원의 회원 번호
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Lesson selectLesson = curService.selectLesson(l);
				
		ArrayList<Curriculum> selectCurriList = curService.selectCurriculum(l);
		
		// 튜터의 회원 번호
		int tutorNo = selectLesson.getMemNo();
		
		// 요청받은 레슨 객체 (레슨 번호 + 튜터 번호)
		l.setMemNo(tutorNo);
		QnA selectQnA = curService.selectQnA(l);
		
		// 레슨 객체 (레슨 번호 + 회원 번호)
		l.setMemNo(memNo);
		
		// 시청한 영상 수
		int videoCount = curService.selectVideoCount(l);
		
		// 별점 가져오기
		int avgStar = curService.selectAverageStar(l);
		
		model.addAttribute("lesson", selectLesson);
		model.addAttribute("qna", selectQnA);
		model.addAttribute("curriculumList", selectCurriList);
		model.addAttribute("videoCount", videoCount);
		model.addAttribute("avgStar", avgStar);
		
		return "user/curriculum/detailCurriculum";
	}
	
	@RequestMapping("lessonInfo.cr")
	public String detailLessonInfo(Lesson l, Model model) {
		
		Lesson selectLesson = curService.selectLesson(l);
		
		model.addAttribute("lesson", selectLesson);
		
		return "user/curriculum/lessonInfo";
	}
	
	@RequestMapping("detailFAQ.cr")
	public String detailFaq(Lesson l, Model model) {
		
		ArrayList<LessonFaq> faqList = curService.detailFAQ(l);
		
		model.addAttribute("faqList", faqList);
		
		return "user/curriculum/detailFAQ";
	}
	
	@RequestMapping("detailQNA.cr")
	public String detailQna(Lesson l, Model model) {
		
		ArrayList<QnA> qnaList = curService.detailQnA(l);
		
		model.addAttribute("qnaList", qnaList);
		
		return "user/curriculum/detailQNA";
	}

//	@RequestMapping("")
//	public String insertQuestion(QnA q, HttpSession session) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String updateQuestion(QnA q, HttpSession session) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String deleteQuestion(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String insertAnswer(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String updateAnswer(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String deleteAnswer(QnA q) {
//		return "";
//	}
	
	@RequestMapping("videoList.cr")
	public String videoList(Lesson l, Model model) {
		return "user/curriculum/videoList";
	}
	
	@RequestMapping("detailVideo.cr")
	public String detailVideo(MemVideo mv) {
		return "user/curriculum/detailVideo";
	}
	
}
