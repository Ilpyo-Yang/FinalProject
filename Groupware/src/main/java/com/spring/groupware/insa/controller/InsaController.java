package com.spring.groupware.insa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.insa.service.InsaService;
import com.spring.groupware.insa.service.InterInsaService;
import com.spring.groupware.insa.model.InsaVO;

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
		List <InsaVO> insaList = service.getInsaList(category);
		mav.addObject("insaList", insaList);
		mav.setViewName("insa/insa.tiles1");
		
		return mav;
	}

	// === insa 등록페이지 요청 === //
	@RequestMapping(value="/insaRegister1.opis")
	public ModelAndView insaRegister1(ModelAndView mav) {
		System.out.println("인사요청");
		mav.setViewName("insa/insaRegister1.tiles1");
		return mav;
	}

	// === insa1 등록완료페이지 요청 === //
	@RequestMapping(value="/insaRegister1End.opis", method= {RequestMethod.POST})
	public ModelAndView insaRegister1End(ModelAndView mav, HttpServletRequest request, InsaVO insavo) {
	//	System.out.println("인사끝");


		int seq = service.getSequence();
		System.out.println("seq=> "+seq);
		int n = service.insaRegister1End(insavo,seq);
		
		
		if(n==1) {
	//		System.out.println("등록성공");
			mav.addObject("seq", seq);
			mav.setViewName("insa/insaView1.tiles1");
		}
		else {

		//	System.out.println("n => "+n);
		//	System.out.println("등록실패");
			mav.setViewName("insa/insa.tiles1");
		}
		
		return mav;
	}
	
	
	
	

	// === insa2 등록페이지 요청 === //
	@RequestMapping(value="/insaRegister2.opis")
	public ModelAndView insaRegister2(ModelAndView mav) {

		mav.setViewName("insa/insaRegister2.tiles1");
		return mav;
	}
	
	// === insa2 등록완료페이지 요청 === //
	@RequestMapping(value="/insaRegister2End.opis", method= {RequestMethod.POST})
	public ModelAndView insaRegister2End(ModelAndView mav, HttpServletRequest request) {
	
		System.out.println("안뇽");
		/*
		 * int n = service.insaRegister1End(insavo,seq);
		 * 
		 * 
		 * if(n==1) { // System.out.println("등록성공"); mav.addObject("seq", seq);
		 * mav.setViewName("insa/insaView1.tiles1"); } else {
		 * 
		 * // System.out.println("n => "+n); // System.out.println("등록실패");
		 * mav.setViewName("insa/insa.tiles1"); }
		 */
		return mav;
	}
	
	
	// === insa view1페이지 요청 === //
	@RequestMapping(value="/insaView1.opis")
	public ModelAndView insaView1(ModelAndView mav, HttpServletRequest request) {
		String seq = request.getParameter("seq");
		InsaVO insavo = service.getInsaView1(seq);
		mav.addObject("insavo", insavo);
		mav.setViewName("insa/insaView1.tiles1");
		return mav;
	}

	
	// === insa view2페이지 요청 === //
	@RequestMapping(value="/insaView2.opis")
	public ModelAndView insaView2(ModelAndView mav, HttpServletRequest request) {
		String seq = request.getParameter("seq");
		List<InsaVO> eduList = service.getEduList(seq);
		mav.addObject("eduList", eduList);
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
		List <InsaVO> insaList = service.getInsaList(category);
		mav.addObject("insaList", insaList);

		mav.setViewName("insa/payment.tiles1");
		return mav;
	}
	
}
