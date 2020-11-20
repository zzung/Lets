package com.kh.ee.user.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ee.user.member.model.service.MemberService;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		return "user/member/loginMember";
	}
	
	@RequestMapping("join.me")
	public String insertMameber(Member m, HttpSession session, Model model) {
		return "user/member/insertMember";
	}
	
//	@ResponseBody()
//	@RequestMapping("")
	
	
	
	
}
