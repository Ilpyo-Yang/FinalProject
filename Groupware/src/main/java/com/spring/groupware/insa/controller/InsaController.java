package com.spring.groupware.insa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.service.InterGroupwareService;

@Component
@Controller
public class InsaController {
	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterGroupwareService service;
	
	
	// === insa 페이지 요청 === //
	@RequestMapping(value="insa.opis")
	public ModelAndView insa(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("/tiles1/insa/insa");
		
		return mav;
	}

	// === insa detail1페이지 요청 === //
	@RequestMapping(value="insaDetail1.opis")
	public ModelAndView insaDetail1(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("/tiles1/insa/insaDetail1");
		return mav;
	}
	// === insa detail2페이지 요청 === //
	@RequestMapping(value="insaDetail2.opis")
	public ModelAndView insaDetail2(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("/tiles1/insa/insaDetail2");
		return mav;
	}
	// === 급여 페이지 요청 === //
	@RequestMapping(value="payment.opis")
	public ModelAndView payment(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("/tiles1/insa/payment");
		return mav;
	}
}
