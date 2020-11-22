package com.kh.ee.user.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {

	@RequestMapping("supportNotice.su")
	public String supportNotice() {
		return "user/support/supportNotice";
	}
	
	@RequestMapping("supportNoticeDetail.su")
	public String supportNoticeDetail() {
		return "user/support/supportNoticeDetail";
	}
	
	@RequestMapping("supportFaq.su")
	public String supportFaq() {
		return "user/support/supportFaq";
	}
	
	@RequestMapping("supportFaqDetail.su")
	public String supportFaqDetail() {
		return "user/support/supportFaqDetail";
	}
	
	
	@RequestMapping("supportInq.su")
	public String supportInq() {
		return "user/support/supportInq";
	}
	
	@RequestMapping("supportInqDetail.su")
	public String supportInqDetail() {
		return "user/support/supportInqDetail";
	}
	
	
}
