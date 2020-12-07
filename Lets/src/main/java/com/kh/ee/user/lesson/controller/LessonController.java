package com.kh.ee.user.lesson.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ee.common.template.Auth;
import com.kh.ee.common.template.Auth.Role;
import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.service.LessonService;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.lesson.model.vo.WishList;
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
	
	@Auth(role = Role.USER)
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
		
		
		Member mem = (Member)session.getAttribute("loginUser");
		//member가 null 일때, 비회원일때
		if(mem == null) {
			model.addAttribute("list", list); 
			model.addAttribute("faqList",faqList);
			model.addAttribute("t", t);
			model.addAttribute("listCount",listCount);
			model.addAttribute("l",lesson); 
			model.addAttribute("isWatching",null);
			model.addAttribute("isWished", null);
			return "user/lesson/classDetailView";
		}
		
		
		WishList wl = new WishList();
		wl.setLessonNo(lessonNo);
		wl.setMemNo(mem.getMemNo());
		
		int result = lService.selectWL(wl); 
		
		String isWished = "N";
		if(result > 0 ) {
			isWished = "Y";
		} 

		
		MemPay mp = new MemPay();
		mp.setLessonNo(lessonNo);
		mp.setMemNo(mem.getMemNo());
		
		System.out.println(mp);
		
		int result2 = lService.selectMemPayList(mp); 
		System.out.println("result2:" + result2);
		
		String isWatching = "N";
		if(result2>0) {
			isWatching = "Y"; 
		}
		
		model.addAttribute("list", list); 
		model.addAttribute("faqList",faqList);
		model.addAttribute("t", t);
		model.addAttribute("listCount",listCount);
		model.addAttribute("l",lesson); 
		model.addAttribute("isWatching",isWatching);
		model.addAttribute("isWished",isWished);
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
	
	@Auth(role = Role.TUTOR)
	@RequestMapping("enroll.le")
	public String enrollLesson(Model model) {
		//커리큘럼 시퀀스번호 알아오고 모델로 저장해놓기  Curriculum
		int CurriculumListNo = lService.CurriculumListNo();
		
		model.addAttribute(CurriculumListNo);
		System.out.println(CurriculumListNo);
		
		return "user/lesson/lessonEnrollForm";
	}
	
	@RequestMapping("insert.le")
	public String insertLesson(Lesson l, MultipartFile lessonUpFile, HttpSession session, Model model) {
		
		
	      //레슨 
	      if(!lessonUpFile.getOriginalFilename().equals("")) {         
	         String changeName = lessonCoverImg(lessonUpFile, session);
	         if(changeName != null) {
	            l.setLessonCoverImg("resources/lesson/lessonPicFiles/" + changeName);
	         }
	      }
	      
	      //준비물
	      ArrayList<String> lessonPrepareList = l.getLessonPrepareList();
	      l.setLessonPrepare(String.join(", ", lessonPrepareList));
	      l.setPayTotal("5000");
	      System.out.println((Member)session.getAttribute("loginUser"));
	      l.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
//	      System.out.println(l.getMemNo());
	      
	      int result = lService.insertLesson(l);
	      
	         
    	 if(result == 0) { // 실패 => 에러문구 담아서 에러페이지로 포워딩
	         model.addAttribute("errorMsg", "클래스 등록 실패");
	         return "common/errorPage";
	      }
	      
	      //커리큘럼
	      ArrayList<Curriculum> curriculumList = l.getCurriculumList();
	      for(Curriculum element:curriculumList) {
	         element.setLessonNo(l.getMemNo());
	         result = lService.insertCurriculum(element);
	         
	    	 if(result == 0) { // 실패 => 에러문구 담아서 에러페이지로 포워딩
		         model.addAttribute("errorMsg", "클래스 등록 실패(커리큘럼 등록 확인해주세요.)");
		         return "common/errorPage";
		      }
	      }
	      

	      //레슨faq
	      ArrayList<LessonFaq> lessonFaqList = l.getLessonFaqList();
	      for(LessonFaq element:lessonFaqList) {
	    	  element.setLessonNo(l.getMemNo());
	         result = lService.insertLessonFaq(element);
	         
	    	 if(result == 0) { // 실패 => 에러문구 담아서 에러페이지로 포워딩
		         model.addAttribute("errorMsg", "클래스 등록 실패(클래스 faq 확인해주세요.)");
		         return "common/errorPage";
		      }
	      }
	      
	      // 비디오
	      ArrayList<Video> videoList = l.getVideoList();
	      for(Video element:videoList) {
	    	  element.setLessonNo(l.getMemNo());
	         result = lService.insertVideo(element);
	         
	    	 if(result == 0) { // 실패 => 에러문구 담아서 에러페이지로 포워딩
		         model.addAttribute("errorMsg", "클래스 등록 실패(비디오 등록에 문제가 있습니다.)");
		         return "common/errorPage";
		      }
	         
	      }
	      
         session.setAttribute("alertMsg", "클래스 등록 요청되었습니다!");
         return "user/tutor/tutorMainView";

	   }
	
	private String lessonCoverImg(MultipartFile upfile, HttpSession sesson) {
		
		String originName = upfile.getOriginalFilename();
		String lessonCoverImgPath = sesson.getServletContext().getRealPath("/resources/lesson/lessonPicFiles");
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int)(Math.random()*90000+10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        
        String changeName = currentTime + ranNum + ext;	
        
        try {
			upfile.transferTo(new File(lessonCoverImgPath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        return changeName;
	}

	
	//결제정보 작성해서 보내기(학천)
	@RequestMapping("paymentProcess.le")
	public String paymentProcess(MemPay mp,HttpSession session,Model model) {
		int result = lService.insertDelInfo(mp);
		
		//mp에서 맴버 번호만 빼서 mem_video에서 관련 lesson 번호빼와서 mem_video에 insert
		
		if(result>0) {
			session.setAttribute("alertMsg","결제 완료 되었습니다.");
			return "redirect:myPage.me";			
		} else {
			model.addAttribute("errorMsg","결제 실패했습니다.");
			return "user/lesson/courseDetailView.le?lessonNo="+mp.getLessonNo();
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("likeCount.le")
	public String likeCount(int lessonNo,WishList wl) {
		int result = lService.likeCount(lessonNo, wl);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("dislikeCount.le")
	public String dislikeCount(int lessonNo, WishList wl) {
		int result = lService.dislikeCount(lessonNo, wl);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	

}
