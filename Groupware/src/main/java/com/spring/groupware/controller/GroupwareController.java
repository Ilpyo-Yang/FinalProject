package com.spring.groupware.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.service.InterGroupwareService;

@Component
@Controller
public class GroupwareController {

	
	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterGroupwareService service;
	
	
	// === #36. 메인페이지 요청 === //
	@RequestMapping(value="/*")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/test.action")
	public ModelAndView login(ModelAndView mav) {
		
		mav.setViewName("test.tiles2");
		// 		/WEB-INF/views/tiles2/test.jsp
		
		return mav;
	}

	
}
