package com.kh.ee.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.ee.user.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
}
