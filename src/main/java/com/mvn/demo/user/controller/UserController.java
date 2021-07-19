package com.mvn.demo.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvn.demo.user.model.LoginDTO;
import com.mvn.demo.user.model.UserVO;
import com.mvn.demo.user.service.UserService;

@Controller
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
	public String accountLoginPage(HttpServletRequest request) {

		return "/user/login";
	}

	@RequestMapping(value = "/account/loginProc", method = RequestMethod.POST)
	public String accountLoginProcess(LoginDTO loginDTO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws NullPointerException {

		log.info("UserController======:{}", loginDTO);

//		String referer = (String) request.getHeader("REFERER");
//		log.info("referer::{}", referer);

		// session 체크
		if (session.getAttribute("account") != null) {
			// 기존 account란 세션 값이 존재할 경우 기존 세션값 제거
			//			session.removeAttribute("account");

			log.error("중복 로그인 에러");

			return "redirect: /account/login?error=true";
		} else {
			UserVO userVO = userService.getUserAccount(loginDTO);

			log.info("{}", userVO);

			if (userVO != null) {
				session.setAttribute("account", userVO);
				return "redirect: /home";

			} else {
				return "redirect: /account/login";
			}
		}

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		Object obj = session.getAttribute("account");

		if (obj != null) {
			UserVO userVO = (UserVO) obj;
			session.removeAttribute("account");
			session.invalidate(); // 세션 초기화
		}

		return "redirect:/account/login"; // 로그아웃 후 로그인화면으로 이동
	}

}
