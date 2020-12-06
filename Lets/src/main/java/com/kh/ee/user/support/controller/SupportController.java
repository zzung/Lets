package com.kh.ee.user.support.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.support.model.service.SupportService;

@Controller
public class SupportController {

	@Autowired
	private SupportService su; 
	
	@RequestMapping("supportNotice.su")
	public String supportNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = su.noticeCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = su.noticeList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "user/support/supportNotice";
	}
	
	@RequestMapping("supportNoticeDetail.su")
	public String supportNoticeDetail() {
		return "user/support/supportNoticeDetail";
	}
	
	

	/*
	 * @RequestMapping("detail.bo") public ModelAndView selectBoard(int bno,
	 * ModelAndView mv) {
	 * 
	 * int result = su.increaseCount(bno);
	 * 
	 * if(result > 0) {
	 * 
	 * mv.addObject("b", bService.selectBoard(bno))
	 * .setViewName("board/boardDetailView");
	 * 
	 * }else {
	 * 
	 * mv.addObject("errorMsg", "유효한 게시글이 아니거나 삭제된 게시글입니다.")
	 * .setViewName("common/errorPage"); }
	 * 
	 * return mv;
	 * 
	 * }
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("supportFaq.su")
	public String supportFaq(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = su.faqCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Faq> list = su.faqList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "user/support/supportFaq";
	}
	
	@RequestMapping("supportFaqDetail.su")
	public String supportFaqDetail() {
		return "user/support/supportFaqDetail";
	}
	
	
	@RequestMapping("supportInq.su")
	public String supportInq(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = su.inqCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Inquiry> list = su.inqList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "user/support/supportInq";
	}
	
	/*
	@RequestMapping("supportInqDetail.su")
	public String supportInqDetail() {
		return "user/support/supportInqDetail";
	}
	*/
	
	@RequestMapping("insertInq.su")
	public String insertInq(Inquiry i, HttpSession session, Model model) {
		
		int result = su.insertInq(i);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의 작성 완료");
			return "redirect:/supportInq.su";
		}else {
			model.addAttribute("errorMsg", "문의 작성 실패");
			return "supportInq.su";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
