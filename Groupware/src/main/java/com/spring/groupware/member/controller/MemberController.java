package com.spring.groupware.member.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.groupware.member.model.CompanyVO;
import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.member.service.InterMemberService;


@Controller
public class MemberController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterMemberService service;
      
   
	   // === 로그인 메인에 회사명 띄우기 === //
	   @RequestMapping(value="/login.opis")
	   public ModelAndView login(HttpServletRequest request, ModelAndView mav) {
		 String com_name = service.getCompanyName();
		 mav.addObject("com_name",com_name);
		 mav.setViewName("login");
	 	 return mav;
	   }
	   
   
   	  // === 로그인 확인하기 === //
      @RequestMapping(value="/loginCheck.opis", method= {RequestMethod.POST})
      public ModelAndView loginCheck(HttpServletRequest request, ModelAndView mav) {
    	  String id = request.getParameter("idInput");
    	  String pwd = request.getParameter("pwdInput");
    	  String ip = request.getRemoteAddr();
    	  
    	  Map<String, String> paraMap = new HashMap<>();
    	  paraMap.put("id", id);
    	  paraMap.put("pwd", pwd);
    	  paraMap.put("ip", ip);
    	  
    	  MemberVO loginuser = service.loginCheck(paraMap);    	     	
		  
    	  if(loginuser==null) {		// 일치하는 멤버가 없을 때
    		  mav.addObject("loginuser", loginuser);
    	      mav.setViewName("redirect:/login.opis");
    	  }
    	  else {	// 일치하는 멤버가 있을 때
    		  if(Integer.parseInt(loginuser.getPwdChangeGap())>5) {	// 비밀번호 변경한지 6개월이 넘은 경우 
    			  HttpSession session = request.getSession();
        		  session.setAttribute("loginuser", loginuser);
        		  mav.setViewName("pwdChange.tiles1");
        	  }
        	  else {
        		  HttpSession session = request.getSession();
        		  session.setAttribute("loginuser", loginuser);
        		  
    		  	  String goBackURL = (String) session.getAttribute("goBackURL");
				 
				  if(goBackURL != null) {
				      mav.setViewName("redirect:/"+goBackURL);
					  session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
				  }
				  else {
					  mav.setViewName("redirect:/mainPage.opis");
				  }
        	  }
    	  }
     	  return mav;
      }      
      
      
     // === 비밀번호 변경요청 === //
      @RequestMapping(value="/pwdChange.opis")
      public ModelAndView pwdChange(ModelAndView mav) {   	  
    	 mav.setViewName("pwdChange.tiles1");
    	 return mav;
      }
      
      
      // === 로그아웃 하기 === //
      @RequestMapping(value="/logout.opis")
      public ModelAndView logout(HttpServletRequest request, ModelAndView mav) {
    	  HttpSession session = request.getSession();
    	  
    	  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
    	  int mbr_seq = loginuser.getMbr_seq();
    	  
    	  service.logout(mbr_seq);    	     	
    	  session.removeAttribute("loginuser");
    	  mav.setViewName("redirect:/login.opis");  // 로그인페이지로 이동  	  
     	  return mav;
      }      
      
      
      // === 메인페이지 === //
      @RequestMapping(value="/mainPage.opis")
      public ModelAndView mainPage(ModelAndView mav) {   	  
    	 mav.setViewName("mainPage.tiles1");
    	 return mav;
      }
      
      
      // === 개인정보설정 === //
      @RequestMapping(value="/personalInfo.opis")
      public ModelAndView personalInfo(ModelAndView mav) {   	  
    	 mav.setViewName("member/personalInfo.tiles1");
    	 return mav;
      }
   
      
      // === 회사정보설정 === //
      @RequestMapping(value="/companyInfo.opis")
      public ModelAndView companyInfo(ModelAndView mav) {   
    	 CompanyVO cvo = service.getCompanyInfo();
    	 String ceo_name = service.getCeoName();
    	 MemberVO mvo = service.getAdminInfo();
    	 
 		 mav.addObject("cvo",cvo);
 		 mav.addObject("ceo_name",ceo_name);
 		 mav.addObject("mvo",mvo);
    	 mav.setViewName("member/companyInfo.tiles1");
    	 return mav;
      }
      
      
      // === 조직도 === //
      @RequestMapping(value="/mbrchart.opis")
      public ModelAndView mbrchart(ModelAndView mav) {   	  
    	 mav.setViewName("member/mbrchart.tiles1");
    	 return mav;
      }
      

}