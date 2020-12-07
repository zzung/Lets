package com.kh.ee.user.member.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.kh.ee.common.template.Auth;
import com.kh.ee.common.template.Auth.Role;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.loginAPI.KakaoLoginBO;
import com.kh.ee.user.member.loginAPI.NaverLoginBO;
import com.kh.ee.user.member.model.service.MemberService;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.tutor.model.service.TutorService;

@Controller
@Auth(role = Role.ADMIN)
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) { this.naverLoginBO = naverLoginBO; }
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bpe;
	@Autowired
	private TutorService tutorService;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm(HttpSession session, Model model) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		String kakaoUrl = KakaoLoginBO.getAuthorizationUrl(session);
	    model.addAttribute("kakaoUrl", kakaoUrl);

		return "user/member/loginForm";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		String bpw = bpe.encode(m.getMemPwd());
		if(loginUser != null && bpe.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			loginUser.setGender(loginUser.getGender().equals("F")? "여":"남");
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공 !");
			
			if(loginUser.getAuth()==3) { // 관리자일 경우
				return "redirect:memberManagement.ad";
			}
			if(tutorService.selectTutor(loginUser.getMemNo()) == null) {
				session.setAttribute("isTutor", false);
			}else {
				session.setAttribute("isTutor", true);
			}
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","로그인에 실패했습니다. 확인 후 다시 시도해주세요.");
			return "user/common/errorPage";
		}
	}
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naverlogin.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLoginCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

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
		m.setMemPic((String) response_obj.get("profile_image"));
		
//		System.out.println("네이버 로그인 : "+m);
		model.addAttribute("result", apiResult);
		
		if((mService.selectMember((String)response_obj.get("email")))!=null) {	// 해당 아이디의 회원이 이미 있을경우
			Member loginUser = mService.loginMember(m);
			loginUser.setGender(loginUser.getGender().equals("F")? "여":"남");
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
	
	// 카카오 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "kakaologin.me", method = { RequestMethod.GET, RequestMethod.POST })
	   public String kakaoLoginCallback(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
	      
	      JsonNode node = KakaoLoginBO.getAccessToken(code); // accessToken에 로그인한 사용자의 모든 정보 있음
	      JsonNode accessToken = node.get("access_token"); // 사용자 토큰
	      JsonNode userInfo = KakaoLoginBO.getKakaoUserInfo(accessToken); 
	      
	      JsonNode properties = userInfo.path("properties");
	      JsonNode kakao_account = userInfo.path("kakao_account");
	      
	      //노드 안에 있는 access_token값을 꺼내 문자열로 변환
	      String token = node.get("access_token").toString();
	      session.setAttribute("token", token);
	      
	      Member m = new Member();
	      m.setMemId(kakao_account.path("email").asText());
	      m.setMemName(properties.path("nickname").asText());
	      m.setNickname(properties.path("nickname").asText());
	      m.setGender((kakao_account.path("gender").asText()).equals("female")? "F" : "M");
	      m.setMemPic(properties.path("profile_image").asText());
//	      System.out.println("카카오 로그인 : "+m);
	      
	      if(mService.selectMember(kakao_account.path("email").asText())!=null) {	// 해당 아이디의 회원이 이미 있을경우
				Member loginUser = mService.loginMember(m);
				loginUser.setGender(loginUser.getGender().equals("F")? "여":"남");
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "카카오 아이디로 로그인 성공 !\\n( ※ 참고 : 다른 카카오 아이디로의 로그인은 카카오에서 직접 로그아웃 한 후에 가능합니다. )");
				return "redirect:/";
				
			}else { // 없으면 회원가입 처리 후 로그인
				int result = mService.insertMember(m);
				if(result > 0) {
					Member loginUser = mService.loginMember(m);
					session.setAttribute("accessToken", accessToken);
					session.setAttribute("loginUser", loginUser);
					session.setAttribute("alertMsg", "카카오 아이디로 로그인 성공 !\\n( ※ 참고 : 다른 카카오 아이디로의 로그인은 카카오에서 직접 로그아웃 한 후에 가능합니다. )");
					return "redirect:/";
				}else {
					model.addAttribute("errorMsg","카카오 아이디로 로그인 처리에 실패했습니다. 관리자에게 문의하세요.");
					return "user/common/errorPage";
				}
			}
	   }
	   
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		
        if(session.getAttribute("token")!=null) {
        	KakaoLoginBO.Logout((String)session.getAttribute("accessToken"));
            session.removeAttribute("accessToken");
        }
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
		if(m.getMemPic()==null) {
			if(m.getGender().equals("F")) {
				m.setMemPic("resources/user/assets/img/member/woman.png");
			}else if(m.getGender().equals("M")) {
				m.setMemPic("resources/user/assets/img/member/woman.png");
			}
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
	
	@Auth(role = Role.USER)
	@RequestMapping("myPage.me")
	public String myPage(HttpSession session, Model model) {
		
		Member memNo = (Member)session.getAttribute("loginUser"); 
		ArrayList<Lesson> onlist = mService.selectOnlineLesson(memNo.getMemNo());
		ArrayList<Lesson> off = mService.selectOffLesson(memNo.getMemNo());
		
		MemVideo mv = new MemVideo();
		ArrayList<MemVideo> mlist = new ArrayList<>();
		
		
		for(Lesson l : onlist) {
			LocalDate endDate = LocalDate.parse(l.getPaymentDate().toString());
			endDate = endDate.plusWeeks(Integer.parseInt(l.getPeriod()));
			
			l.setEndDate(endDate.toString());
			
			mv.setLessonNo(l.getLessonNo());
			mv.setMemNo(l.getMemNo());
			
		}
		System.out.println("mvLessonNo:" + mv.getLessonNo());
		
		for(Lesson lo : off) {
			LocalDate endDate = LocalDate.parse(lo.getPaymentDate().toString());
			endDate = endDate.plusWeeks(Integer.parseInt(lo.getPeriod()));
			
			lo.setEndDate(endDate.toString());
			
		}
		
		model.addAttribute("off", off);
		model.addAttribute("onlist",onlist); 
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
	
	@Auth(role = Role.USER)
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
		
	@Auth(role = Role.USER)
	@RequestMapping("delete.me")
	public String deleteMember(String memPwdDelCheck, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(memPwdDelCheck != null) {
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
		}else {
			int result = mService.deleteMember(loginUser.getMemId());
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴 완료 ! Bye !");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg","회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
				return "user/common/errorPage";
			}
		}
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("myWishList.me")
	public String myWishList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<Lesson> myWishList = mService.myWishList(loginUser.getMemNo());
		int myWishListCount = mService.myWishListCount(loginUser.getMemNo());
		session.setAttribute("myWishList", myWishList);
		session.setAttribute("myWishListCount", myWishListCount);
		
		return "user/member/myWishList";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("myDeliveryList.me")
	public String myDeliveryList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<MemPay> myDlist = mService.myDeliveryList(loginUser.getMemNo());
		int myDlistCount = mService.myDlistCount(loginUser.getMemNo());
		session.setAttribute("myDlist", myDlist);
		session.setAttribute("myDlistCount", myDlistCount);
		
		return "user/member/myDeliveryList";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("myDetailDel.me")
	public String myDetailDelivery(int memPayNo, HttpSession session) {
		
		MemPay mp = mService.myDetailDelivery(memPayNo);
		session.setAttribute("mp", mp);
		System.out.println(mp);
		return "user/member/myDetailViewDelivery";
	}
	
	@Auth(role = Role.USER)
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
	
	@Auth(role = Role.USER)
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
	
	@ResponseBody
	@RequestMapping(value="showDiscountLesson.le", produces="application/json; charset=utf-8")
	public String showDiscountLesson() {
		Lesson l = mService.showDiscountLesson();
		
		return new Gson().toJson(l); 
	}
	
}
