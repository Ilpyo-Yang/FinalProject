package com.spring.groupware.insa.controller;

import java.util.List;

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
		String category = request.getParameter("category");
		if(category==null) {
			category="6";
		}
		List <MemberVO> memberList = service.getMemberList(category);
		mav.addObject("memberList", memberList);
		mav.setViewName("insa/insa.tiles1");
		
		return mav;
	}

	// === insa 등록페이지 요청 === //
	@RequestMapping(value="/insaRegister1.opis")
	public ModelAndView insaRegister1(ModelAndView mav) {

		mav.setViewName("insa/insaRegister1.tiles1");
		return mav;
	}

	// === insa 등록완료페이지 요청 === //
	@RequestMapping(value="/insaRegister1End.opis", method= {RequestMethod.POST})
	public ModelAndView insaRegister1End(ModelAndView mav, HttpServletRequest request, MemberVO membervo) {

		int n = service.insaRegister1End(membervo);
		String path="";
		if(n==1) {
			System.out.println("등록성공");
			path ="insa/insaView1.tiles1";
		}
		else {

			System.out.println("등록실패");
			path ="insa/insa.tiles1";
		}
		mav.setViewName(path);
		return mav;
	}
	

	// === insa2 등록페이지 요청 === //
	@RequestMapping(value="/insaRegister2.opis")
	public ModelAndView insaRegister2(ModelAndView mav) {

		mav.setViewName("insa/insaRegister2.tiles1");
		return mav;
	}
	
	// === insa view1페이지 요청 === //
	@RequestMapping(value="/insaView1.opis")
	public ModelAndView insaView1(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("insa/insaView1.tiles1");
		return mav;
	}

	
	// === insa view1페이지 요청 === //
	@RequestMapping(value="/insaView2.opis")
	public ModelAndView insaView2(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("insa/insaView2.tiles1");
		return mav;
	}
	
	
	
	// === 급여 페이지 요청 === //
	@RequestMapping(value="/payment.opis")
	public ModelAndView payment(ModelAndView mav, HttpServletRequest request) {
		String category = request.getParameter("category");
		if(category==null) {
			category="6";
		}
		System.out.println(category);
		List <MemberVO> memberList = service.getMemberList(category);
		mav.addObject("memberList", memberList);

		mav.setViewName("insa/payment.tiles1");
		return mav;
	}
}
