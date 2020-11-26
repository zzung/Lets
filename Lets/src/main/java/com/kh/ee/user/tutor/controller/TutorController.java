package com.kh.ee.user.tutor.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ee.user.faq.model.service.FaqService;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.service.MemPayService;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.tutor.model.service.TutorService;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Controller
public class TutorController {
	@Autowired
	private FaqService faqService;
	@Autowired
	private LessonService lessonService;
	@Autowired
	private MemPayService memPayService;
	
	@Autowired
	private TutorService tutorService;
	
	@RequestMapping("tutorMain.tm")
	public String tutorMain(Model model) {
		
		ArrayList<Faq> list = faqService.selectTutorFaqList();
		
		model.addAttribute("list",list);
		return "user/tutor/tutorMainView";
	}
	
	@RequestMapping("tutorMyLesson.tm")
	public String tutorMyLesson(int memNo, Model model) {
		
		ArrayList<Lesson> aLlist = lessonService.selectApproveLessonList();
		ArrayList<Lesson> sLlist = lessonService.selectApproveStatusList();
		ArrayList<MemPay> mpList = memPayService.selectPrepareList();
		
		model.addAttribute("aLlist", aLlist);
		model.addAttribute("sLlist", sLlist);
		model.addAttribute("mpList", mpList);
		
		return "user/tutor/myClassView";
	}
	
	@RequestMapping("tutorEnroll.te")
	public String insertFormTutor() {
		return "user/tutor/tutorEnrollForm";
	}
	
	@RequestMapping("insert.tt")
	public String insertTutor(Tutor t, HttpSession session, MultipartFile upfile) {

		int result = tutorService.insertTutorInfo(t);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 튜터 등록되었습니다!");
			return "redirect:tutorMain.tm";
		}else {
			session.setAttribute("alertMsg", "튜터 등록에 실패하였습니다!");
			return "redirect:tutorEnroll.te";
		}
		
	}
	@ResponseBody
	@RequestMapping("deleteLesson.tl")
	public String deleteLesson(int lno) {
		int result = lessonService.deleteLesson(lno);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

}
