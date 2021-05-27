package com.spring.groupware.sns.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.groupware.service.InterGroupwareService;

@Component
@Controller
public class GroupwareSnsController {

	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterGroupwareService service;
	
	@RequestMapping(value="/sns/snsmain.opis")
	public String sns_main() {
		
		
		return "sns/snsmain";
	}
	
	@RequestMapping(value="/sns/snstalkroom.opis")
	public String snstalkroom() {
		return "sns/talkroom";
	}
}
