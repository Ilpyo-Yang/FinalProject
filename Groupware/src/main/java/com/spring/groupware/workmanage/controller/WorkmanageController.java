package com.spring.groupware.workmanage.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class WorkmanageController {


	// == 할 일 리스트 보여주기 == //   
	@RequestMapping(value="/todolist.opis")
	public ModelAndView todolist(ModelAndView mav) {
		mav.setViewName("workmanage/todolist_view.tiles1");
		return mav;
	}
	
	// == 업무 등록 하기 == //
	@RequestMapping(value="/worklistAdd.opis")
	public ModelAndView worklistAdd(ModelAndView mav) {
		mav.setViewName("workmanage/worklist_add.tiles1");
		return mav;
	}
}
