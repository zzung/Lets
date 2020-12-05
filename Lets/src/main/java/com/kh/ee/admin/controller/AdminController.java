package com.kh.ee.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ee.admin.model.service.AdminService;
import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Auth;
import com.kh.ee.common.template.Auth.Role;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as; 
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("memberManagement.ad")
	public String memberManagement(){
		return "admin/memberManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("classManagement.ad")
	public String classManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.classMgmtCountList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Lesson> list = as.classMgmtList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi); 
		
		return "admin/classManagementView";
	}
	
	@Auth(role = Role.ADMIN)
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
	
	@Auth(role = Role.ADMIN)
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
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("searchClassMgmt.ad")
	public String searchClassMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "title" : sc.setTitle(keyword); break;
		case "writer" : sc.setWriter(keyword); break;
		case "approval" : sc.setApproval(keyword);
		}
		
		int listCount = as.searchClassMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Lesson> list = as.searchClassMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/classManagementView";		
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("classPayment.ad")
	public String classPayment(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.classPaymentListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<MemPay> mp = as.classPaymentList(pi);
		
		model.addAttribute("mp",mp); 
		model.addAttribute("pi",pi);
		
		return "admin/classPaymentView";
	}
	
	@Auth(role = Role.ADMIN)
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
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("searchPaymentMgmt.ad")
	public String searchPaymentMgmt(String condition, String keyword, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "title" : sc.setTitle(keyword); break;
		case "writer" : sc.setWriter(keyword); break;
		case "payment" : sc.setPayment(keyword);
		}
		
		int listCount = as.searchPaymentMgmtCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<MemPay> mp = as.searchPaymentMgmtList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("mp",mp);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/classPaymentView";		
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("saleManagement.ad")
	public String saleManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.selectListCount(); 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> m = as.selectDiscountList(pi);
		
		model.addAttribute("m",m); 
		model.addAttribute("pi",pi); 
		return "admin/discountManagementView"; 
	}
	
	@Auth(role = Role.ADMIN)
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
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("searchDiscount.ad")
	public String searchDiscount(String condition, String keyword,int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "writer" : sc.setWriter(keyword); break;
		case "percentage" : sc.setPercentage(keyword); break;
		case "title" : sc.setTitle(keyword);
		}
		
		int listCount = as.searchDiscountCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> m = as.searchDiscountList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("m",m);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/discountManagementView";
		
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("discountUnApplied.ad")
	public String searchDiscountUnApplied(int currentPage, Model model) {
		int listCount = as.countDiscountUnApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountUnApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("discountApplied.ad")
	public String searchDiscountApplied(int currentPage, Model model) {
		int listCount = as.countDiscountApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("blacklistManagement.ad")
	public String blacklistManagement(){
		return "admin/blacklistManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("inqueryManagement.ad")
	public String inqueryManagement(){
		return "admin/inqueryManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("reportManagement.ad")
	public String reportManagement(){
		return "admin/reportManagementView";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("noticeManagement.ad")
	public String noticeManagement(){
		return "admin/noticeManagementView";
	}

	@Auth(role = Role.ADMIN)
	@RequestMapping("faqManagement.ad")
	public String faqManagement(){
		return "admin/faqManagementView";
	}
}