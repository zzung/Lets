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
import com.kh.ee.user.curriculum.model.vo.Video;
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
		Lesson selectLesson = curService.selectLesson(l);
		
		model.addAttribute("lesson", selectLesson);
		model.addAttribute("faqList", faqList);
		
		return "user/curriculum/detailFAQ";
	}
	
	@RequestMapping("detailQNA.cr")
	public String detailQna(Lesson l, Model model) {
		
		ArrayList<QnA> qnaList = curService.detailQnA(l);
		Lesson selectLesson = curService.selectLesson(l);
		
		model.addAttribute("lesson", selectLesson);
		model.addAttribute("qnaList", qnaList);
		
		return "user/curriculum/detailQNA";
	}

	@RequestMapping("insertQuestion.cr")
	public String insertQuestion(QnA q, Model model) {
		
		int result = curService.insertQuestion(q);
		
		if(result > 0) {			
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();
		} else {
			model.addAttribute("errorMsg", "질문 작성에 실패했습니다.");
			
			return "user/common/errorPage";
		}
		
	}
	
	@RequestMapping("updateQuestion.cr")
	public String updateQuestion(QnA q, Model model) {
		
		int result = curService.updateQuestion(q);
		
		if(result > 0) {
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();			
		} else {
			model.addAttribute("errorMsg", "질문 수정에 실패했습니다.");
			
			return "user/common/errorPage";
		}
		
	}
	
	@RequestMapping("deleteQuestion.cr")
	public String deleteQuestion(QnA q, Model model) {
		
		int result = curService.deleteQuestion(q);
		
		if(result > 0) {			
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();
		} else {
			model.addAttribute("errorMsg", "질문 삭제에 실패했습니다.");
			
			return "user/common/errorPage";
		}
	}
	
	@RequestMapping("insertAnswer.cr")
	public String insertAnswer(QnA q, Model model) {
		
		int result = curService.insertAnswer(q);
		
		if(result > 0) {
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();			
		} else {
			model.addAttribute("errorMsg", "답변 작성에 실패했습니다.");
			
			return "user/common/errorPage";
			
		}
	}
	
	@RequestMapping("updateAnswer.cr")
	public String updateAnswer(QnA q, Model model) {
		
		int result = curService.updateAnswer(q);
		
		if(result > 0) {
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();			
		} else {
			model.addAttribute("errorMsg", "답변 수정에 실패했습니다.");
			
			return "user/common/errorPage";
			
		}
		
	}
	
	@RequestMapping("deleteAnswer.cr")
	public String deleteAnswer(QnA q, Model model) {
		
		int result = curService.deleteAnswer(q);
		
		if(result > 0) {
			return "redirect:detailQNA.cr?lessonNo=" + q.getLessonNo();			
		} else {
			model.addAttribute("errorMsg", "답변 삭제에 실패했습니다.");
			
			return "user/common/errorPage";
			
		}
		
	}
	
	@RequestMapping("videoList.cr")
	public String videoList(Lesson l, Model model) {
		
		Lesson selectLesson = curService.selectLesson(l);
		ArrayList<Video> videoList = curService.videoList(l);
		
		model.addAttribute("videoList", videoList);
		model.addAttribute("lesson", selectLesson);
		
		return "user/curriculum/videoList";
		
	}
	
	@RequestMapping("detailVideo.cr")
	public String detailVideo(MemVideo mv, Model model) {
		
		int result = curService.updateVideoStatus(mv);
		
		if(result > 0) {
			Video video = curService.detailVideo(mv);
			
			model.addAttribute("video", video);
			
			return "user/curriculum/detailVideo";
		} else {
			model.addAttribute("errorMsg", "영상 재생에 실패했습니다.");
			
			return "user/common/errorPage";
		}
		
	}
	
}
