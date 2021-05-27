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
		System.out.println("인사요청");
		mav.setViewName("insa/insaRegister1.tiles1");
		return mav;
	}

	// === insa 등록완료페이지 요청 === //
	@RequestMapping(value="/insaRegister1End.opis", method= {RequestMethod.POST})
	public ModelAndView insaRegister1End(ModelAndView mav, HttpServletRequest request, MemberVO membervo) {
		/*
		membervo.setFk_power_no(Integer.parseInt(request.getParameter("fk_power_no")));
		System.out.println(membervo.getFk_power_no());
		
		membervo.setFk_dept_no(Integer.parseInt(request.getParameter("fk_dept_no")));
		membervo.setMbr_id(request.getParameter("mbr_id"));
		membervo.setMbr_pwd(request.getParameter("mbr_pwd"));
		membervo.setMbr_name(request.getParameter("mbr_name"));
		membervo.setMbr_email(request.getParameter("mbr_email"));
		membervo.setMbr_com_number(request.getParameter("mbr_com_number"));
		membervo.setMbr_phone_number(request.getParameter("mbr_phone_number"));
		membervo.setMbr_gender(request.getParameter("mbr_gender"));
		membervo.setMbr_registerday(request.getParameter("mbr_registerday"));
		membervo.setMbr_retireday(request.getParameter("mbr_retireday"));
		membervo.setMbr_status(request.getParameter("mbr_status"));*/
		
		
		System.out.println("인사끝");

		int n = 1;//service.insaRegister1End(membervo);
		
		if(n==1) {
			System.out.println("등록성공");
			mav.setViewName("insa/insaView1.tiles1");
		}
		else {

			System.out.println("등록실패");
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
