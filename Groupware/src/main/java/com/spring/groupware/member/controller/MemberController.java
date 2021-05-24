package com.spring.groupware.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.member.service.InterMemberService;


@Controller
public class MemberController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterMemberService service;
      
   
      // === 로그인하기 === //
      @RequestMapping(value="/loginCheck.opis", method= {RequestMethod.POST})
      public ModelAndView loginCheck(HttpServletRequest request, ModelAndView mav) {
    	  String id = request.getParameter("idInput");
    	  String pwd = request.getParameter("pwdInput");
    	  
    	  int n = service.loginCheck(id, pwd);
    	  
    	  
    	  
    	  return mav;
      }
      
      
      
}