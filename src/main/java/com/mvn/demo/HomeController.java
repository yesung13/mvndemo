package com.mvn.demo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	//forward 일 경우 모델 값을 가지고 반환한다.
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testPage(Model model) {
		model.addAttribute("test", "testval");
		return "forward: /board/list";
	}

	//redirect 일 경우 모델 값이 반환되는 주소에 쿼리스트링으로 노출된다.
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String testPage2(Model model) {
		model.addAttribute("test", "testval2");
		return "redirect: /board/list";
	}

}
