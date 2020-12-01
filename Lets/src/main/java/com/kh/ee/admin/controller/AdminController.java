package com.kh.ee.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ee.admin.model.service.AdminService;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as; 
	
	@RequestMapping("memberManagement.ad")
	public String memberManagement(){
		return "admin/memberManagementView";
	}
	
	@RequestMapping("classManagement.ad")
	public String classManagement(){
		return "admin/classManagementView";
	}
	
	@RequestMapping("classPayment.ad")
	public String classPayment(){
		return "admin/classPaymentView";
	}
	
	@RequestMapping("saleManagement.ad")
	public String saleManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.selectListCount(); 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> m = as.selectDiscountList(pi);
		
		model.addAttribute("m",m); 
		model.addAttribute("pi",pi); 
		return "admin/discountManagementView"; 
	}
	
	@RequestMapping("blacklistManagement.ad")
	public String blacklistManagement(){
		return "admin/blacklistManagementView";
	}
	
	@RequestMapping("inqueryManagement.ad")
	public String inqueryManagement(){
		return "admin/inqueryManagementView";
	}
	
	@RequestMapping("reportManagement.ad")
	public String reportManagement(){
		return "admin/reportManagementView";
	}
	
	@RequestMapping("noticeManagement.ad")
	public String noticeManagement(){
		return "admin/noticeManagementView";
	}

	@RequestMapping("faqManagement.ad")
	public String faqManagement(){
		return "admin/faqManagementView";
	}
	
	
}
