package com.kh.ee.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ee.admin.model.service.AdminService;
import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.faq.model.vo.Faq;
import com.kh.ee.user.inquiry.model.vo.Inquiry;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.notice.model.vo.Notice;
import com.kh.ee.user.report.model.vo.Report;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as; 
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("memberManagement.ad")
	public String memberManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.memberMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = as.memberMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/memberManagementView";
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchMemberMgmt.ad")
	public String searchMemberMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "memName" : sc.setMemName(keyword); break;
		case "nickname" : sc.setNickname(keyword); break;
		case "memId" : sc.setMemId(keyword);
		}
		
		int listCount = as.searchMemberMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = as.searchMemberMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/memberManagementView";		
	}

	//@Auth(role = Role.ADMIN)
	@RequestMapping("classManagement.ad")
	public String classManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.classMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Lesson> list = as.classMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/classManagementView";
	}
	
	//@Auth(role = Role.ADMIN)
	@ResponseBody
	@RequestMapping("lessonApproval.ad")
	public String lessonApproval(int lessonNo) {
		int result = as.lessonApproval(lessonNo);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//@Auth(role = Role.ADMIN)
	@ResponseBody
	@RequestMapping("rejectApproval.ad")
	public String rejectApproval(Lesson l) {
		int result = as.rejectApproval(l);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchClassMgmt.ad")
	public String searchClassMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "title" : sc.setTitle(keyword); break;
		case "writer" : sc.setWriter(keyword); break;
		case "approval" : sc.setApproval(keyword);
		}
		
		int listCount = as.searchClassMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Lesson> list = as.searchClassMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/classManagementView";		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("classPayment.ad")
	public String classPayment(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.classPaymentListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<MemPay> mp = as.classPaymentList(pi);

		model.addAttribute("mp",mp); 
		model.addAttribute("pi",pi);
		
		return "admin/classPaymentView";
	}
	
	//@Auth(role = Role.ADMIN)
	@ResponseBody
	@RequestMapping("cancelPay.ad")
	public String cancelPay(int memPayNo) {
		int result = as.cancelPay(memPayNo);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchPaymentMgmt.ad")
	public String searchPaymentMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "title" : sc.setTitle(keyword); break;
		case "writer" : sc.setWriter(keyword); break;
		case "payment" : sc.setPayment(keyword);
		}
		
		int listCount = as.searchPaymentMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<MemPay> mp = as.searchPaymentMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("mp",mp);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/classPaymentView";		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("saleManagement.ad")
	public String saleManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.selectListCount(); 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Member> m = as.selectDiscountList(pi);
		
		model.addAttribute("m",m); 
		model.addAttribute("pi",pi); 
		return "admin/discountManagementView"; 
	}
	
	//@Auth(role = Role.ADMIN)
	@ResponseBody
	@RequestMapping("discountSet.ad")
	public String discountSet(Lesson l) {
		int result = as.discountSet(l); 
		
		if(result>0) {
			return "success";
		}else {
			return "fail"; 
		}
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchDiscount.ad")
	public String searchDiscount(String condition, String keyword,int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "writer" : sc.setWriter(keyword); break;
		case "percentage" : sc.setPercentage(keyword); break;
		case "title" : sc.setTitle(keyword);
		}
		
		int listCount = as.searchDiscountCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("m",m);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/discountManagementView";
		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("discountUnApplied.ad")
	public String searchDiscountUnApplied(int currentPage, Model model) {
		int listCount = as.countDiscountUnApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountUnApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("discountApplied.ad")
	public String searchDiscountApplied(int currentPage, Model model) {
		int listCount = as.countDiscountApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("blacklistManagement.ad")
	public String blacklistManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.blacklistMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = as.blacklistMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/blacklistManagementView";
		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchBlacklistMgmt.ad")
	public String searchBlacklistMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "nickname" : sc.setNickname(keyword); break;
		case "memId" : sc.setMemId(keyword);
		}
		
		int listCount = as.searchBlacklistMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = as.searchBlacklistMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/blacklistManagementView";		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("inquiryManagement.ad")
	public String inqManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.inquiryMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Inquiry> list = as.inquiryMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/inquiryManagementView";
	}
	
	
	@RequestMapping("inqAnswer.ad")
	public String inqAnswer(Inquiry i) {
		
		int result = as.inqAnswer(i);
		
		if(result > 0) {
			
			return "redirect:inquiryManagement.ad";
		}else {
		
			return "common/errorPage";
		}
	}
	
	

	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchInquiryMgmt.ad")
	public String searchInquiryMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "nickname" : sc.setNickname(keyword); break;
		case "inqType" : sc.setInqType(keyword); break;
		case "inqTitle" : sc.setInqTitle(keyword);
		
		}
		
		int listCount = as.searchInquiryMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Inquiry> list = as.searchInquiryMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/inquiryManagementView";		
	}

	//@Auth(role = Role.ADMIN)
	@RequestMapping("reportManagement.ad")
	public String reportManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.reportMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Report> list = as.reportMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/reportManagementView";
	}
	
	//@Auth(role = Role.ADMIN)
		@RequestMapping("searchReportMgmt.ad")
		public String searchReportMgmt(String condition, String keyword, int currentPage, Model model) {
			
			SearchCondition sc = new SearchCondition(); 
			
			switch(condition) {
			case "nickname" : sc.setNickname(keyword); break;
			case "reportType" : sc.setReportType(keyword); break;
			case "status" : sc.setStatus(keyword);
			
			}
			
			int listCount = as.searchReportMgmtCount(sc);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<Report> list = as.searchReportMgmtList(sc,pi); 
			
			model.addAttribute("pi",pi);
			model.addAttribute("list",list);
			model.addAttribute("condition",condition);
			model.addAttribute("sc",sc);
			model.addAttribute("keyword",keyword);
			
			return "admin/reportManagementView";		
		}

	//@Auth(role = Role.ADMIN)
	@RequestMapping("noticeManagement.ad")
	public String noticeManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.noticeMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = as.noticeMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/noticeManagementView";
	}
	
	@RequestMapping("insertNotice.ad")
	public String insertNotice(Notice n, HttpSession session, Model model) {
		
		int result = as.insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지 작성 완료");
			return "redirect:/noticeManagement.ad";
		}else {
			model.addAttribute("errorMsg", "공지 작성 실패");
			return "noticeManagement.ad";
		}
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("searchNoticetMgmt.ad")
	public String searchNoticeMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "noticeType" : sc.setNoticeType(keyword); break;
		case "noticeTitle" : sc.setNoticeTitle(keyword); 
		
		}
		
		int listCount = as.searchNoticeMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = as.searchNoticeMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/noticeManagementView";		
	}
	
	//@Auth(role = Role.ADMIN)
	@RequestMapping("faqManagement.ad")
	public String faqManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.faqMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Faq> list = as.faqMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/faqManagementView";
	}
	
	@RequestMapping("insertFaq.ad")
	public String insertFaq(Faq f, HttpSession session, Model model) {
		
		int result = as.insertFaq(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "FAQ 작성 완료");
			return "redirect:/faqManagement.ad";
		}else {
			model.addAttribute("errorMsg", "FAQ 작성 실패");
			return "faqManagement.ad";
		}
	}
	
	
	
}