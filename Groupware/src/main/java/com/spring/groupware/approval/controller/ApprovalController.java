package com.spring.groupware.approval.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.member.model.CompanyVO;
import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.member.service.InterMemberService;


@Controller
public class ApprovalController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterMemberService service;
      
        
      // === 기안문작성 메인 === //
      @RequestMapping(value="/approvalMain.opis")
      public ModelAndView approvalMain(ModelAndView mav) {   	  
    	 mav.setViewName("approval/approvalMain.tiles1");
    	 return mav;
      }
      
      
      // === 일반결의서 === //
      @RequestMapping(value="/approvalForm1.opis")
      public ModelAndView approvalForm1(ModelAndView mav) {   	  
    	 mav.setViewName("approval/approvalForm1.tiles1");
    	 return mav;
      }
      
      // === 지출결의서 === //
      @RequestMapping(value="/approvalForm2.opis")
      public ModelAndView approvalForm2(ModelAndView mav) {   	  
    	 mav.setViewName("approval/approvalForm2.tiles1");
    	 return mav;
      }
      
      // === 휴가계획서 === //
      @RequestMapping(value="/approvalForm3.opis")
      public ModelAndView approvalForm3(ModelAndView mav) {   	  
    	 mav.setViewName("approval/approvalForm3.tiles1");
    	 return mav;
      }
      
      
      // === 결재진행함 === //
      @RequestMapping(value="/approvalProcess.opis")
      public ModelAndView approvalProcess(ModelAndView mav) {   	  
    	 mav.setViewName("approval/approvalProcess.tiles1");
    	 return mav;
      }
      
      
      // === 서명관리 === //
      @RequestMapping(value="/sign.opis")
      public ModelAndView sign(ModelAndView mav) {   	  
    	 mav.setViewName("approval/sign.tiles1");
    	 return mav;
      }
      

}