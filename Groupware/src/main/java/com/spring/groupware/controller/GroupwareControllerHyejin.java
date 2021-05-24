package com.spring.groupware.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.service.InterGroupwareService;

@Component
@Controller
public class GroupwareControllerHyejin {
	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterGroupwareService service;
	
	
	// === index 페이지 요청 === //
	@RequestMapping(value="index.opis")
	public String index() {
		
		return "index";
	}
	
	// === insa 페이지 요청 === //
	@RequestMapping(value="insa.opis")
	public ModelAndView insa(ModelAndView mav, HttpServletRequest request) {
		
		return mav;
	}

	// === insa 페이지 요청 === //
	@RequestMapping(value="insaDetail.opis")
	public ModelAndView insaDetail(ModelAndView mav, HttpServletRequest request) {
		
		return mav;
	}
	// === 급여 페이지 요청 === //
	@RequestMapping(value="payment.opis")
	public ModelAndView payment(ModelAndView mav, HttpServletRequest request) {
		
		return mav;
	}
}
