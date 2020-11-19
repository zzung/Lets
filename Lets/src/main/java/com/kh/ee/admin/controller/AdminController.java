package com.kh.ee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("memberManagement.ad")
	public String memberManagement(){
		return "admin/memberManagementView";
	}
	
	@RequestMapping("tutorManagement.ad")
	public String tutorManagement(){
		return "admin/tutorManagementView";
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

}
