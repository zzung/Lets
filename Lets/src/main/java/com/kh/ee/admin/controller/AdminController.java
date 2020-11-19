package com.kh.ee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
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
	public String saleManagement(){
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

}
