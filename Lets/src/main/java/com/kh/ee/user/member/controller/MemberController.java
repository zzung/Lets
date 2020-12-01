package com.kh.ee.user.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.loginAPI.KakaoLoginBO;
import com.kh.ee.user.member.loginAPI.NaverLoginBO;
import com.kh.ee.user.member.model.service.MemberService;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bpe;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm(HttpSession session, Model model) {
		
		// 네이버아이디로 인증 URL 생성 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);

		return "user/member/loginForm";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		String bpw = bpe.encode(m.getMemPwd());
		if(loginUser != null && bpe.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공 !");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","로그인에 실패했습니다. 확인 후 다시 시도해주세요.");
			return "user/common/errorPage";
		}
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naverlogin.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어옴
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		Member m = new Member();	
		m.setMemId((String)response_obj.get("email"));
		m.setMemName((String) response_obj.get("name"));
		m.setNickname((String)response_obj.get("nickname"));
		m.setGender((String)response_obj.get("gender"));
		
		model.addAttribute("result", apiResult);
		
		if((mService.selectMember((String)response_obj.get("email")))!=null) {	// 해당 아이디의 회원이 이미 있을경우
			Member loginUser = mService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "네이버 아이디로 로그인 성공 !\\n( ※ 참고 : 다른 네이버 아이디로의 로그인은 네이버에서 직접 로그아웃 한 후에 가능합니다. )");
			return "redirect:/";
			
		}else { // 없으면 회원가입 처리 후 로그인
			int result = mService.insertMember(m);
			if(result > 0) {
				Member loginUser = mService.loginMember(m);
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "네이버 아이디로 로그인 성공 !\\n( ※ 참고 : 다른 네이버 아이디로의 로그인은 네이버에서 직접 로그아웃 한 후에 가능합니다. )");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg","네이버 아이디로 로그인 처리에 실패했습니다. 관리자에게 문의하세요.");
				return "user/common/errorPage";
			}
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
		
		if(m.getMemPwd()!=null) {
			String encPwd = bpe.encode(m.getMemPwd());
			m.setMemPwd(encPwd);
		}
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
	public String findPwdFirst(String memId, HttpSession session) {
		
		int result = mService.idCheck(memId);
		session.setAttribute("memId", memId);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("findPwdSecond.me")
	public String findPwdSecond(HttpSession session) {
		
		String firstStepId = (String)session.getAttribute("memId");
		session.setAttribute("firstStepId", firstStepId);
		return "user/member/findPwdSecond";
	}
	
	@ResponseBody
	@RequestMapping("sendEmailCheck.me")
	public String sendEmailCheck(int randNum, String memId, HttpSession session) {
		
		String fromMail = "letsEE1209@gmail.com";
        String toMail = memId; 
        String title = "Lets 인증 이메일 입니다.";
        String content = System.getProperty("line.separator")+System.getProperty("line.separator")+
                		"안녕하세요 회원님, 저희 Lets를 찾아주셔서 감사합니다. :)"+System.getProperty("line.separator")+
                		System.getProperty("line.separator")+"인증번호는 " +randNum+ " 입니다. "+
                		System.getProperty("line.separator")+System.getProperty("line.separator")+
                		"받으신 인증번호를 Lets페이지에 입력해주세요."+System.getProperty("line.separator");
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(fromMail);
            messageHelper.setTo(toMail);
            messageHelper.setSubject(title); 
            messageHelper.setText(content);
            
            mailSender.send(message);
            return "success";
            	
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
	}
	
	@ResponseBody
	@RequestMapping("compChecknum.me")
	public String compareCheckNumber(int checkNumber, int randNum, HttpSession session) {
		
		if(checkNumber==randNum) {
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
			return "user/common/errorPage";
		}
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, MultipartFile changeMemPic, HttpSession session, Model model) throws IOException {
		
		if(m.getMemPwd()!=null) {
			String encPwd = bpe.encode(m.getMemPwd());
			m.setMemPwd(encPwd);
		}
		if(!changeMemPic.getOriginalFilename().equals("")){
			String fileName = saveFileManager(changeMemPic, session);
			if(fileName != null) {
				m.setMemPic("resources/user/assets/img/member/" + fileName);
			}
		}
		int result = mService.updateMember(m);
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "회원 정보 수정 완료 !");
			return "redirect:myPage.me";
		}else {
			model.addAttribute("errorMsg", "회원 정보 수정에 실패했습니다. 다시 시도해주세요.");
			return "user/common/errorPage";
		}
	}

	public String saveFileManager(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();
		String savePath = session.getServletContext().getRealPath("/resources/user/assets/img/member/");
		
		try {
			upfile.transferTo(new File(savePath + originName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return originName;
	}
			
	@RequestMapping("delete.me")
	public String deleteMember(String memPwdDelCheck, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bpe.matches(memPwdDelCheck, loginUser.getMemPwd())){
			
			int result = mService.deleteMember(loginUser.getMemId());
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴 완료 ! Bye !");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg","회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
				return "user/common/errorPage";
			}
		}else {
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			return "redirect:myPage.me";
		}
	}
	
	@RequestMapping("myWishList.me")
	public String myWishList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<Lesson> myWishList = mService.myWishList(loginUser.getMemNo());
		int myWishListCount = mService.myWishListCount(loginUser.getMemNo());
		session.setAttribute("myWishList", myWishList);
		session.setAttribute("myWishListCount", myWishListCount);
		
		return "user/member/myWishList";
	}
	
	@RequestMapping("myDeliveryList.me")
	public String myDeliveryList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<MemPay> myDlist = mService.myDeliveryList(loginUser.getMemNo());
		int myDlistCount = mService.myDlistCount(loginUser.getMemNo());
		session.setAttribute("myDlist", myDlist);
		session.setAttribute("myDlistCount", myDlistCount);
		
		return "user/member/myDeliveryList";
	}
	
	@RequestMapping("myDetailDel.me")
	public String myDetailDelivery(int memPayNo, HttpSession session) {
		
		MemPay mp = mService.myDetailDelivery(memPayNo);
		session.setAttribute("mp", mp);
		System.out.println(mp);
		return "user/member/myDetailViewDelivery";
	}
	
	@RequestMapping("myUpdateDel.me")
	public String myUpdateDelivery(int memPayNo, HttpSession session, Model model) {
		
		int result = mService.myUpdateDelivery(memPayNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "배송 확정 처리 되었습니다.");
			return "redirect:myDeliveryList.me";
		}else {
			model.addAttribute("errorMsg", "배송 확정 처리에 실패했습니다. 관리자에게 문의하세요.");
			return "user/common/errorPage";
		}
	}
	
	@RequestMapping("myCancelDel.me")
	public String myCancelDelivery(int memPayNo, HttpSession session, Model model) {
		
		int result = mService.myCancelDelivery(memPayNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "결제 취소 처리 되었습니다.");
			return "redirect:myDeliveryList.me";
		}else {
			model.addAttribute("errorMsg","결제 취소 처리에 오류가 생겼습니다. 관리자에게 문의하세요.");
			return "user/common/errorPage";
		}
	}
	
}
