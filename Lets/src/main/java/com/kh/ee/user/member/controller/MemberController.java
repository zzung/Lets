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
	public String logout(HttpSession session) {
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
		m.setMemPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공 ! 로그인 페이지로 이동합니다.");
			return "redirect:/loginForm.me";
		}else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
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
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "user/member/myPage";
	}
	
	@RequestMapping("findId.me")
	public String findId() {
		return "user/member/findIdForm";
	}
	
	@RequestMapping("findIdResult.me")
	public String findId(Member m, Model model) {
		
		Member mem = mService.findId(m);
		if(mem != null) {
			model.addAttribute("mem", mem);
		}else {
			model.addAttribute("errorMsg","일치하는 회원 정보가 없습니다.");
		}
		return "user/member/findIdResult";
	}
	
	@RequestMapping("findPwdForm.me")
	public String findPwd() {
		return "user/member/findPwdForm";
	}
	
	@ResponseBody
	@RequestMapping("findPwdFirst.me")
	public String findPwdFirst(String memId) {
		
		int result = mService.idCheck(memId);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("findPwdSecond.me")
	public String findPwdSecond(HttpSession session) {
		
		int sendRandNum = (int)(Math.random()*900000)+100000;
		System.out.println(sendRandNum);
		session.setAttribute("sendRandNum", sendRandNum);
		
		return "user/member/findPwdSecond";
	}
	
	@ResponseBody
	@RequestMapping("compChecknum.me")
	public String compareCheckNumber(int checkNumber, HttpSession session) {
		
		int sendRandNum = (int)session.getAttribute("sendRandNum");
		if(checkNumber==sendRandNum) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("findPwdThird.me")
	public String findPwdThird(String memId, HttpSession session) {

		Member m = mService.selectMember(memId);
		session.setAttribute("m", m);
		
		return "user/member/findPwdThird";
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m, HttpSession session, Model model) {
		
		String encPwd = bpe.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		int result = mService.updatePwd(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "비밀번호 수정 성공 ! 로그인 페이지로 이동합니다.");
			return "redirect:loginForm.me";
		}else {
			model.addAttribute("errorMsg", "비밀번호 재설정에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	/*
	@RequestMapping("updateMember.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		
		String encPwd = bpe.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		
	}
	*/
	
	
}
