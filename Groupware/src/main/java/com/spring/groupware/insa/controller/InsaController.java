package com.spring.groupware.insa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.insa.service.InsaService;
import com.spring.groupware.insa.service.InterInsaService;
import com.spring.groupware.member.model.MemberVO;

@Component
@RestController
public class InsaController {
	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterInsaService service;
	
	
	// === insa 페이지 요청 === //
	@RequestMapping(value="/insa.opis")
	public ModelAndView insa(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("/tiles1/insa/insa");
		
		return mav;
	}

	// === insa 등록페이지 요청 === //
	@RequestMapping(value="/insaRegister.opis")
	public ModelAndView insaRegister(ModelAndView mav) {

		mav.setViewName("/tiles1/insa/insaRegister");
		return mav;
	}

	@RequestMapping(value="/insaRegisterEnd.opis.opis", method= {RequestMethod.POST})
	public ModelAndView insaRegisterEnd(ModelAndView mav, HttpServletRequest request, MemberVO membervo) {
		int n = service.insaRegisterEnd(membervo);
		if(n==1) {
			System.out.println("등록성공");
		}
		else {

			System.out.println("등록실패");
		}
		mav.setViewName("/tiles1/insa/insa");
		return mav;
	}
	
	
	
	// === insa detail2페이지 요청 === //
	@RequestMapping(value="/insaDetail2.opis")
	public ModelAndView insaDetail2(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("/tiles1/insa/insaDetail2");
		return mav;
	}
	// === 급여 페이지 요청 === //
	@RequestMapping(value="/payment.opis")
	public ModelAndView payment(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("/tiles1/insa/payment");
		return mav;
	}
}
