package com.spring.groupware.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.schedule.service.InterScheduleService;

@Component
@Controller
public class ScheduleController {

	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterScheduleService service;
	
	// 접속자별 일정페이지 보여주기
	@RequestMapping(value="/myscd.opis")
	public ModelAndView myscd(ModelAndView mav) {
		
		mav.setViewName("schedule/myscd.tiles1");
		// /WEB-INF/views/tiles1/schedule/myscd.jsp
		return mav;
	}
	
	// 일정 등록 페이지 보여주기(모달창)
	@RequestMapping(value="/scd_register.opis")
	public ModelAndView scdRegister(ModelAndView mav) {
		
		mav.setViewName("schedule_modal/scd_register");
		return mav;
	}
	
	
	@RequestMapping(value="/mtr_resv.opis")
	public ModelAndView mtrResv(ModelAndView mav) {
		
		mav.setViewName("schedule_modal/mtr_resv");
		return mav;
	}
	
	
}
