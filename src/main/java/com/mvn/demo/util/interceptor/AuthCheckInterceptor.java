package com.mvn.demo.util.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mvn.demo.user.model.UserVO;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	private final Logger log = LoggerFactory.getLogger(HandlerInterceptor.class);

	// 요청을 컨트롤러에 보내기 전 작업
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("Interceptor > preHandle");
		log.info("[preHandle][" + request + "]" + "[" + request.getMethod() + "]" + request.getRequestURI());
		log.info("interceptor Referer::{}", request.getHeader("referer"));

		HttpSession session = request.getSession();

		UserVO account = (UserVO) session.getAttribute("account");

		if (account != null) {

			return true;
		} else {
			// 기존 account란 세션 값이 존재할 경우 기존 세션값 제거
			session.removeAttribute("account");
			try {
				response.sendRedirect("/account/login");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}

		//        if (request.getRequestURI().equals("/account/login") ||
		//                request.getRequestURI().equals("/account/signUp")) {
		//            if (account != null) {
		//                return true;
		//            }
		//        }
		//        if (account == null) {  //url이 /login 아닌 모든 경우 로그인 되어 있지 않으면
		//            response.sendRedirect(request.getContextPath() + "/account/login");
		//            return false; //현재 URL 페이지 실행 않고 login 실행
		//        } else {
		//            return true; //현재 URL 페이지 실행
		//        }

		//        return super.preHandle(request, response, handler);
		//        response.sendRedirect(request.getContextPath() + "/account/login");
		//        return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("Interceptor > postHandle");
		log.info("[postHandle][" + request + "]");
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("Interceptor > afterCompletion");
		log.info("[afterCompletion][" + request + "][exception: " + ex + "]");
		super.afterCompletion(request, response, handler, ex);
	}
}
