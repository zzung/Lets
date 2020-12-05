package com.kh.ee.common.template;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ee.user.member.model.vo.Member;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
			
		// 1. controller 종류 확인
		// Controller에 있는 메서드가 HandlerMethod 타입인지 체크
		if( controller instanceof HandlerMethod == false ) {
			// return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
			// return false면 Controller 진행 x 바로 응답
			return true;
		}

		// 2. @Auth 받아오기
		HandlerMethod handlerMethod = (HandlerMethod)controller;
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		
		// 3. @Auth가 없는 경우, 즉 인증이 필요 없는 요청
		if( auth == null ) {
			return true;
		}
		
		// 4. @Auth가 있는 경우, 세션이 있는지 체크
		HttpSession session = request.getSession();
		String role = auth.role().toString();
//
//		if( session == null ) {
//			if(role.equals("ADMIN")) {
//				request.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다. ※");
//				response.sendRedirect(request.getContextPath());
//			}else if (role.equals("TUTOR")) {
//				request.setAttribute("alertMsg", "※ 튜터 회원만 이용 가능한 서비스 입니다. ※");
//				response.sendRedirect(request.getContextPath()+"/tutorMain.tm");
//			}else if (role.equals("USER")) {
//				request.setAttribute("alertMsg", "※ 로그인 후 이용가능한 서비스 입니다. ※");
//				response.sendRedirect(request.getContextPath() + "/loginForm.me");
//			}
//			return false;
//		}
		
		// 4-1. 세션이 존재하면 유효한 유저인지 확인 
		Member authUser = (Member)session.getAttribute("loginUser");
		if ( authUser == null ) {
			if(role.equals("ADMIN")) {
				session.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다.※");
				response.sendRedirect(request.getContextPath());
			}else if (role.equals("TUTOR")) {
				session.setAttribute("alertMsg", "※ 튜터 회원만 이용 가능한 서비스 입니다. ※");
				response.sendRedirect(request.getContextPath()+"/tutorMain.tm");
			}else if (role.equals("USER")) {
				session.setAttribute("alertMsg", "※ 로그인 후 이용가능한 서비스 입니다.11 ※");
				response.sendRedirect(request.getContextPath() + "/loginForm.me");
			}
			return false;
		}
		
		// 4-2. User/Tutor/Admin 일때
		if(role.equals("ADMIN")) {
			if(authUser.getAuth()==3) {
				return true;
			}else if(authUser.getAuth()==2) {
				session.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다. ※");
				response.sendRedirect(request.getContextPath());
				return false;
			}else if(authUser.getAuth()==1) {
				session.setAttribute("alertMsg", "※ 튜터 회원만 이용 가능한 서비스 입니다. ※");
				response.sendRedirect(request.getContextPath()+"/tutorMain.tm");
				return false;
			}
		}
		if(role.equals("TUTOR")) {
			if(authUser.getAuth()==3) {
				return true;
			}else if(authUser.getAuth()==2) {
				return true;
			}else if(authUser.getAuth()==1) {
				session.setAttribute("alertMsg", "※ 튜터 회원만 이용 가능한 서비스 입니다. ※");
				response.sendRedirect(request.getContextPath()+"/tutorMain.tm");
				return false;
			}
		}
		if(role.equals("USER")) {
			if(authUser.getAuth()==3) {
				return true;
			}else if(authUser.getAuth()==2) {
				return true;
			}else if(authUser.getAuth()==1) {
				return true;
			}
		}
		
		
		// 5. 접근허가, 즉 메서드를 실행하도록 함
		return true;
	
	}	
}
