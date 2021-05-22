package com.spring.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.service.InterGroupwareService;

@Component
@Controller
public class WorkmanageController {


//	@RequestMapping(value="/todolist.action")
//	public String index() {
//		return "index";
//	}
	
	@RequestMapping(value="/todolist.action")
	public ModelAndView todolist(ModelAndView mav) {
		mav.setViewName("workmanage/todolist");
		return mav;
	}
}
