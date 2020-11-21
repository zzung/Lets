package com.kh.ee.user.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {

	@RequestMapping("support.su")
	public String supportList() {
		return "user/support/supportListView";
	}
	
}
