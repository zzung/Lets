package com.kh.ee.user.tutor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.faq.model.service.FaqService;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.service.MemPayService;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.service.MemberService;
import com.kh.ee.user.member.model.vo.Member;
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
	private MemberService mService;
	
	@Autowired
	private TutorService tutorService;
	
	@RequestMapping("tutorMain.tm")
	public String tutorMain( Model model) {
		
		ArrayList<Faq> list = faqService.selectTutorFaqList();
		
		model.addAttribute("list",list);
		return "user/tutor/tutorMainView";
	}
	
	@RequestMapping("tutorMyLesson.tm")
	public String tutorMyLesson(Model model, HttpSession session, @RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Lesson> aLlist = lessonService.selectApproveLessonList(loginUser.getMemNo());
		ArrayList<Lesson> sLlist = lessonService.selectApproveStatusList(loginUser.getMemNo());
		
		int listCount = memPayService.selectListCount(loginUser.getMemNo());
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<MemPay> mpList = memPayService.selectPrepareList(loginUser.getMemNo(), currentPage);
		
		
		
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
	public String insertTutor(Tutor t, HttpSession session, MultipartFile upfile, Model model) {
		
		
		String originName = upfile.getOriginalFilename();
		
		String picSavePath = session.getServletContext().getRealPath("/resources/tutor/tutorPicFiles/");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(picSavePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(changeName != null) {
			t.setTutorPic("resources/tutor/tutorPicFiles/" + changeName);
			
		}
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		t.setMemNo(memNo);

		int result = tutorService.insertTutorInfo(t);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 튜터 등록되었습니다!");
			return "redirect:tutorMain.tm";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
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
	
	@RequestMapping("delivery.tm")
	public String updateDelivery(MemPay mp) {
		System.out.println(mp);
		int result = memPayService.updateDelivery(mp);
		
		return "redirect:tutorMyLesson.tm";
	}
	
	
}
