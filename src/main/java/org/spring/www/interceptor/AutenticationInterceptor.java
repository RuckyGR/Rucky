package org.spring.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AutenticationInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터 preHandle()메소드 수행");
		
		HttpSession session = request.getSession();
		String loginId =(String) session.getAttribute("userId");
		String loginName = (String) session.getAttribute("userName");
		
		//uri에서 경로(context제외한 나머지)만 가져오기
		String path = request.getServletPath();
		System.out.println("path : " + path);
		
		if (loginId == null) {
			response.sendRedirect("login.do");
			return false;//프리핸들메소드 종료시킴
		}
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
		// 따라서 true로하면 컨트롤러 uri로 가게 됨.
		return true;
	}
	
	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		System.out.println("인터셉터 opstHandle()메소드 수행");
	}
	
	
}
