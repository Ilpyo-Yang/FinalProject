package com.spring.groupware.insa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.spring.groupware.insa.model.CertiVO;
import com.spring.groupware.insa.model.EduVO;
import com.spring.groupware.insa.model.InsaVO;
import com.spring.groupware.insa.model.PaymentVO;

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
		System.out.println("seq1=> "+seq);
		insavo.setMbr_seq(seq);
		int n = service.insaRegister1End(insavo);
		
		
		if(n==1) {
	//		System.out.println("등록성공");
			mav.setViewName("redirect:/insaView1.opis?seq="+seq);
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

		
		String seq = request.getParameter("seq");
		

		System.out.println(request.getParameter("schoolResult"));
		String eduLevelResult= request.getParameter("eduLevelResult").substring(0,request.getParameter("eduLevelResult").length()-1);
		String schoolResult= request.getParameter("schoolResult").substring(0,request.getParameter("schoolResult").length()-1);
		String majorResult= request.getParameter("majorResult").substring(0,request.getParameter("majorResult").length()-1);

		String[] eduLevelArr = eduLevelResult.split(",");
		String[] schoolArr = schoolResult.split(",");
		String[] majorArr = majorResult.split(",");
		
		int n = 1;
		for(int i=0; i<eduLevelArr.length ; i++) {
			EduVO evo = new EduVO();
			
			evo.setMbr_seq(Integer.parseInt(seq));
			evo.setEduLevel(String.valueOf(eduLevelArr[i]));
			evo.setSchool(String.valueOf(schoolArr[i]));
			evo.setMajor(String.valueOf(majorArr[i]));
			
			// 학력정보 입력하기
			n *= service.insaRegister2EndEdu(evo);
		}

		System.out.println(request.getParameter("certificationResult"));
		System.out.println(request.getParameter("certiyyResult"));
		String certificationResult= request.getParameter("certificationResult").substring(0,request.getParameter("certificationResult").length()-1);
		String certiLevelResult= request.getParameter("certiLevelResult").substring(0,request.getParameter("certiLevelResult").length()-1);
		String certiyyResult= request.getParameter("certiyyResult").substring(0,request.getParameter("certiyyResult").length()-1);
		String certimmResult= request.getParameter("certimmResult").substring(0,request.getParameter("certimmResult").length()-1);
		String certiddResult= request.getParameter("certiddResult").substring(0,request.getParameter("certiddResult").length()-1);

		String[] certificationArr = certificationResult.split(",");
		String[] certiLevelArr = certiLevelResult.split(",");
		String[] certiyyArr = certiyyResult.split(",");
		String[] certimmArr = certimmResult.split(",");
		String[] certiddArr = certiddResult.split(",");
		
		int m = 1;
		for(int i=0; i<certificationArr.length; i++) {
			CertiVO cvo = new CertiVO();
			
			cvo.setMbr_seq(Integer.parseInt(seq));
			cvo.setCertification(String.valueOf(certificationArr[i]));
			cvo.setCertiLevel(Integer.parseInt(certiLevelArr[i]));
			
			String year = String.valueOf(certiyyArr[i]);
			String month = String.valueOf(certimmArr[i]);
			String day = String.valueOf(certiddArr[i]);
			if(Integer.parseInt(month)<10) {
				month = "0"+month;
			}
			if(Integer.parseInt(day)<10) {
				day = "0"+day;
			}
			cvo.setCertiDate(year+"-"+month+"-"+day);
			

			// 자격증정보 입력하기
			m *= service.insaRegister2EndCerti(cvo);
		}
		
	
		  
		 if(n*m==1) { 
			 System.out.println("등록성공"); 
			 mav.addObject("seq", seq);
			 mav.setViewName("insa/insaView2.tiles1");
				mav.setViewName("redirect:/insaView2.opis?seq="+seq);
		 } 
		 else {
			 System.out.println("n => "+n); 
			 System.out.println("등록실패");
			 mav.setViewName("insa/insa.tiles1"); 
			 }
		
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
		System.out.println("seq2=> "+seq);
		// 학력 리스트 가져오기
		List<EduVO> eduList = service.getEduList(seq);
		// 최종학력 가져오기
		String eduLevel = service.getEduLevel(seq);
		
		// 자격증 리스트 가져오기
		List<CertiVO> certiList = service.getCertiList(seq);

		// 학력정보 가져오기
		int n = service.getEduNum(seq);
		// 자격증정보 가져오기
		int m = service.getCertiNum(seq);

		System.out.println("n=> "+n);
		System.out.println("m=> "+m);
		
		if(n!=0 || m!=0) {
			mav.addObject("seq", seq);
			mav.addObject("eduLevel", eduLevel);
			mav.addObject("eduList", eduList);
			mav.addObject("certiList",certiList);
			mav.setViewName("insa/insaView2.tiles1");
		}
		else {
			mav.addObject("seq", seq);
			mav.setViewName("insa/insaRegister2.tiles1");			
		}
		return mav;
	}
	
	
	
	// === 급여 페이지 요청 === //
	@RequestMapping(value="/payment.opis")
	public ModelAndView payment(ModelAndView mav, HttpServletRequest request) {
		String category = request.getParameter("category");
		if(category==null) {
			category="6";
		}
		List <InsaVO> insaList = service.getInsaList(category);
		mav.addObject("category", category);
		mav.addObject("insaList", insaList);

		mav.setViewName("insa/payment.tiles1");
		return mav;
	}

	
	// === 급여 상세 페이지 요청 === //
	@RequestMapping(value="/paymentDetail.opis")
	public ModelAndView paymentDetail(ModelAndView mav, HttpServletRequest request) {

		String seq = request.getParameter("seq");
		String category = request.getParameter("category");
		
		// 개인별 급여 리스트 가져오기
		List <PaymentVO> paymentList = service.getPaymentList(seq);
		
		// 개인 인사정보 가져오기
		InsaVO insavo = service.getInsaView1(seq);

		mav.addObject("category", category);
		mav.addObject("paymentList", paymentList);
		mav.addObject("insavo", insavo);

		mav.setViewName("insa/paymentDetail.tiles1");
		return mav;
	}
	
}
