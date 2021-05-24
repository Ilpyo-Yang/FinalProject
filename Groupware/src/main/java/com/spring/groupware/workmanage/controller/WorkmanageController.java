package com.spring.groupware.workmanage.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class WorkmanageController {


//	@RequestMapping(value="/todolist.action")
//	public String index() {
//		return "index";
//	}
	
	@RequestMapping(value="/todolist.opis")
	public ModelAndView todolist(ModelAndView mav) {
		mav.setViewName("workmanage/todolist");
		return mav;
	}
}
