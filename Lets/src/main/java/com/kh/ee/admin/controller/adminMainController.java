package com.kh.ee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminMainController {
	
	@RequestMapping(".ad")
	public String adminMain() {
		return "admin/adminMainView";
	}

}