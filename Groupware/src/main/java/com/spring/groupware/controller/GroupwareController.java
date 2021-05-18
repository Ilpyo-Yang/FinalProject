package com.spring.groupware.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	
}
