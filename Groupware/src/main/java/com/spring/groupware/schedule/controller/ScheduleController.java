package com.spring.groupware.schedule.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.schedule.model.MtrHistoryVO;
import com.spring.groupware.schedule.model.ScheduleVO;
import com.spring.groupware.schedule.service.InterScheduleService;

@Component
@Controller
public class ScheduleController {

	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private InterScheduleService service;
	
	// 접속자별 일정페이지 보여주기
	@RequestMapping(value="/myscd.opis")
	public ModelAndView requiredmyscd(ModelAndView mav) {
		
		mav.setViewName("schedule/myscd.tiles1");
		// /WEB-INF/views/tiles1/schedule/myscd.jsp
		return mav;
	}
	
	// 일정 등록 페이지 보여주기
	@RequestMapping(value="/scd_register.opis")
	public ModelAndView scdRegister(ModelAndView mav) {
		
		mav.setViewName("schedule_modal/scd_register");
		return mav;
	}
	
	// 회의실 예약 페이지 보여주기
	@RequestMapping(value="/mtr_resv.opis")
	public ModelAndView mtrResv(ModelAndView mav) {
		
		mav.setViewName("schedule_modal/mtr_resv");
		return mav;
	}
	
	// 일정 등록하기
	@RequestMapping(value="/scdRegEnd.opis", method = {RequestMethod.POST})
	public ModelAndView scdRegEnd(ModelAndView mav, ScheduleVO schedulevo) {
		
		int n = service.scdAdd(schedulevo);	// 일정 등록하기
		
		if(n==1) {	// 일정 등록 성공
			mav.setViewName("redirect:/scdDetail.opis");
		}
		
		else {	// 일정 등록 실패
			String message = "일정 등록에 실패하였습니다. 다시 시도하세요";
			String loc = "javascript:history.back()";
			
			mav.addObject("message",message);
			mav.addObject("loc",loc);
			
			mav.setViewName("msg");
		}
		
		return mav;
	}
	
	// 등록된 일정 상세 확인 페이지
	@RequestMapping(value="/scdDetail.opis")
	public ModelAndView scdDetail(HttpServletRequest request, ModelAndView mav) {
		
		String scdno = request.getParameter("scdno");
		
		try {
			Integer.parseInt(scdno);
			
			int login_mbrno = 0;
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if(loginuser != null) {
				login_mbrno = loginuser.getMbr_seq();
			}
			
			ScheduleVO schedulevo = null;
			
			// 등록된 일정 상세 내용 조회
			schedulevo = service.getViewScd(scdno, login_mbrno);
			
			mav.addObject("schedulevo", schedulevo);
			
		} catch (Exception e) {
			
		}
		
		return mav;
	}
	
	// 회의실 예약하기
	@RequestMapping(value="/regMtrEnd.opis", method = {RequestMethod.POST})
	public ModelAndView regMtrEnd(ModelAndView mav, MtrHistoryVO mtrhvo) {
		
		int n = service.regMtrEnd(mtrhvo);
		
		if(n==1) {
			mav.setViewName("redirect:/mtrhDetail.opis");
		}
		else {
			String message = "회의실 예약에 실패하였습니다. 다시 시도하세요";
			String loc = "javascript:history.back()";
			
			mav.addObject("message",message);
			mav.addObject("loc",loc);
			
			mav.setViewName("msg");
		}
		
		return mav;
	}
	 
	// 회의실 예약상세페이지 보여주기
	
	
	
	
}
