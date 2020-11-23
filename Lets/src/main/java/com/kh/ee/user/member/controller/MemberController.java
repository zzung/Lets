package com.kh.ee.user.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@Autowired
	private BCryptPasswordEncoder bpe;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/member/loginForm";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bpe.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공 !");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","로그인에 실패했습니다. 다시 시도해주세요.");
			return "user/common/errorPage";
		}
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "user/member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		
		String encPwd = bpe.encode(m.getMemPwd());
		System.out.println("암호화 후(암호문) : "+encPwd);
		
		m.setMemPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공 !");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다. ");
			return "user/common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String memId) {
		
		int result = mService.idCheck(memId);
		if(result > 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	@ResponseBody
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String nickname) {
		int result = mService.nicknameCheck(nickname);
		if(result > 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	
	
}
