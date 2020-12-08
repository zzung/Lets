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
			
		if( controller instanceof HandlerMethod == false ) {
			return true;
		}

		HandlerMethod handlerMethod = (HandlerMethod)controller;
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		if( auth == null ) {
			return true;
		}
		
		HttpSession session = request.getSession();
		String role = auth.role().toString();
		Member authUser = (Member)session.getAttribute("loginUser");
		if ( authUser == null ) {
			if(role.equals("ADMIN")) {
				session.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다.※");
				response.sendRedirect(request.getContextPath());
			}else if (role.equals("TUTOR")) {
				session.setAttribute("alertMsg", "※ 튜터 회원만 이용 가능한 서비스 입니다. ※");
				response.sendRedirect(request.getContextPath()+"/tutorMain.tm");
			}else if (role.equals("USER")) {
				session.setAttribute("alertMsg", "※ 로그인 후 이용가능한 서비스 입니다. ※");
				response.sendRedirect(request.getContextPath() + "/loginForm.me");
			}
			return false;
		}
		
		if(role.equals("ADMIN")) {
			if(authUser.getAuth()==3) {
				return true;
			}else if(authUser.getAuth()==2) {
				session.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다. ※");
				response.sendRedirect(request.getContextPath());
				return false;
			}else if(authUser.getAuth()==1) {
				session.setAttribute("alertMsg", "※ 잘못된 접근 경로입니다. ※");
				response.sendRedirect(request.getContextPath());
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

		return true;
	
	}	
}
