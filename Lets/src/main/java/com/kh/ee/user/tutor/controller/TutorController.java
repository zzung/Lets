package com.kh.ee.user.tutor.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Auth;
import com.kh.ee.common.template.Auth.Role;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.faq.model.service.FaqService;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.service.MemPayService;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.service.MemberService;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.salary.model.service.SalaryService;
import com.kh.ee.user.salary.model.vo.Salary;
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
	private SalaryService salService;
	
	@Autowired
	private TutorService tutorService;
	
	// 튜터메인(수현)
	@Auth(role = Role.USER)
	@RequestMapping("tutorMain.tm")
	public String tutorMain( Model model) {
		
		ArrayList<Faq> list = faqService.selectTutorFaqList();
		
		model.addAttribute("list",list);
		return "user/tutor/tutorMainView";
	}
	
	// 내수업페이지(수현)
	@Auth(role = Role.TUTOR)
	@RequestMapping("tutorMyLesson.tm")
	public String tutorMyLesson(Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Lesson> aLlist = lessonService.selectApproveLessonList(loginUser.getMemNo());
		ArrayList<Lesson> sLlist = lessonService.selectApproveStatusList(loginUser.getMemNo());
		ArrayList<MemPay> msList = memPayService.selectSalaryList(loginUser.getMemNo());
		
		model.addAttribute("aLlist", aLlist);
		model.addAttribute("sLlist", sLlist);
		model.addAttribute("msList", msList);
		return "user/tutor/myClassView";
			
	}
	
	//튜터등록페이지 (현선)
	@Auth(role = Role.USER)
	@RequestMapping("tutorEnroll.te")
	public String insertFormTutor() {
		return "user/tutor/tutorEnrollForm";
	}
	
	//튜터등록 (현선)
	@Auth(role = Role.USER)
	@RequestMapping("insert.tt")
	public String insertTutor(Tutor t, HttpSession session, MultipartFile tutorUpfile, Model model) {
		
		
	      if(!tutorUpfile.getOriginalFilename().equals("")) {
	          String changeName = saveFile(tutorUpfile, session);
	          
	          if(changeName != null) {
	        	  t.setTutorPic("resources/tutor/tutorPicFiles/" + changeName);
	          }
	       }

		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		t.setMemNo(memNo);

		int result = tutorService.insertTutorInfo(t);
		int result2 = tutorService.getTutorAuth(t.getMemNo()); // 튜터 권한 주기(승희)
		
		if(result*result2 != 0) {
			// 튜터 등록시 세션 리업로드
	         String memId = ((Member)session.getAttribute("loginUser")).getMemId();
	         session.removeAttribute("loginUser");
	         session.removeAttribute("isTutor");
	         session.setAttribute("loginUser", mService.selectMember(memId));
	         session.setAttribute("isTutor", true);
			
			session.setAttribute("alertMsg", "성공적으로 튜터 등록되었습니다!");
			return "redirect:tutorMain.tm";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 튜터정보 수정페이지 (현선)
	@Auth(role = Role.TUTOR)
	@RequestMapping("tutorFormUpdate.te")
	public String updateFormTutor(int memNo, Model model) {
		
		Tutor t = tutorService.selectTutor(memNo);
		model.addAttribute("t", t);
				
		return "user/tutor/tutorUpdateForm";
	}
	
	// 튜터정보 수정 (현선)
	@Auth(role = Role.TUTOR)
	@RequestMapping("tutorUpdate.te")
	public String updateTutor(Tutor t, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(t.getTutorPic() != null) {
				String removeTutorFilePath = session.getServletContext().getRealPath(t.getTutorPic());
				new File(removeTutorFilePath).delete();
			}
			
			String changeName = saveFile(reupfile, session);
			t.setTutorPic(reupfile.getOriginalFilename());
			t.setTutorPic("resources/tutor/tutorPicFiles/" + changeName);
			
		}
		
		int result = tutorService.updateTutorInfo(t);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 튜터정보가 수정되었습니다.");
			return "redirect:tutorMain.tm";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}	
		
	}
	
	private String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String picSavePath = session.getServletContext().getRealPath("/resources/tutor/tutorPicFiles/");
		
//		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
//		int ranNum = (int)(Math.random()*90000+10000);
//		String ext = originName.substring(originName.lastIndexOf("."));
//		
//		String changeName = currentTime + ranNum + ext;
		
		
		
		try {
			upfile.transferTo(new File(picSavePath + originName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
		return originName;
	}
	
	// 내수업 lesson삭제 (수현)
	@Auth(role = Role.TUTOR)
	//@ResponseBody
	@RequestMapping("deleteLesson.tl")
	public String deleteLesson(int lno, Model model, HttpSession session) {
		int result = lessonService.deleteLesson(lno);
	
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 삭제신청 되었습니다.");
			session.removeAttribute("alertMsg");
			return "redirect:tutorMyLesson.tm";
		}else {
			model.addAttribute("errorMsg", "수업 삭제 실패");
			return "redirect:tutorMyLesson.tm";
		}
	}
	
	// 내수업 lesson삭제 (수현)
		@Auth(role = Role.TUTOR)
		@ResponseBody
		@RequestMapping("deleteLes.tl")
		public String deleteLesson(int lno) {
			int result = lessonService.deleteLesson(lno);
			
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
			
		}
		
	
	// 내수업 택배사,번호 update(수현)
	@Auth(role = Role.TUTOR)
	@RequestMapping("delivery.tm")
	public String updateDelivery(MemPay mp, Model model) {
		
		int result = memPayService.updateDelivery(mp);
		
		if(result > 0) {
			return "redirect:tutorMyLesson.tm";			
		}else {
			model.addAttribute("errorMsg", "배송 사항 입력 실패");
			return "redirect:tutorMyLesson.tm";
		}
		
	}
	
	// 튜터계좌번호insert (수현)
	@RequestMapping("insertSalary.ts")
	public String insertSalary(Salary s) {
		ArrayList<Salary> salaryList = s.getSalaryList();
		ArrayList<Integer> slno = s.getLsno();
		
		for(int lessonNo :slno) {
			s.setLessonNo(lessonNo);
			for(Salary sal:salaryList) {
				s.setAccount(sal.getBankName() +","+ sal.getAccountNo());
			}
			salService.insertSalary(s);
		}
		return "redirect:tutorMyLesson.tm";
	}
	
	// 준비물 테이블, 페이징(수현)
	@ResponseBody
	@RequestMapping(value="prepareList.tm", produces="application/json; charset=utf-8")
	public String prepareList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, int memNo) {
		
		int listCount = memPayService.selectListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<MemPay> list = memPayService.selectPrepareList(memNo, pi);
		
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("pi", pi);
		hmap.put("list",list);
		return new Gson().toJson(hmap); 
	}
	
}
