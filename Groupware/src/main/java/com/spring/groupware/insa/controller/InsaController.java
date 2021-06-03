package com.spring.groupware.insa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
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
	      mav.setViewName("insa/insaRegister1.tiles1");
	      return mav;
	   }
	   // === insa1 등록완료페이지 요청 === //
	   @RequestMapping(value="/insaRegister1End.opis", method= {RequestMethod.POST})
	   public ModelAndView insaRegister1End(ModelAndView mav, HttpServletRequest request, InsaVO insavo) {
	   //   System.out.println("인사끝");
		   
		   int seq = service.getSequence();
		      insavo.setMbr_seq(seq);
		      int n = service.insaRegister1End(insavo);


		      if(n==1) {
		   //      System.out.println("등록성공");
		         mav.setViewName("redirect:/insaView1.opis?seq="+seq);
		      }
		      else {
		      //   System.out.println("n => "+n);
		      //   System.out.println("등록실패");
		         mav.setViewName("insa/insa.tiles1");
		      }

		      return mav;
		   }


		// === insa2 학력 등록페이지 요청 === //
		   @RequestMapping(value="/insaRegister2.opis")
		   public ModelAndView insaRegister2(ModelAndView mav, HttpServletRequest request) {

		      String seq = request.getParameter("seq");
		      String maxEduLevel = service.getMaxEduLevel(seq);

		      System.out.println("^^ seq=> "+seq);
		      System.out.println("^^ maxEduLevel=> "+maxEduLevel);

		      List<EduVO> eduList = service.getEduList(seq);
		      List<CertiVO> certiList = service.getCertiList(seq);

		      mav.addObject("eduList", eduList);
		      mav.addObject("certiList", certiList);
		      mav.addObject("maxEduLevel", maxEduLevel);
		      mav.addObject("seq", seq);

		      mav.setViewName("insa/insaRegister2.tiles1");
		      return mav;
		   }


		   // === insa2 등록완료페이지 요청 === //
		   @RequestMapping(value="/insaRegister2EduEnd.opis", method= {RequestMethod.POST})
		   public ModelAndView insaRegister2EduEnd(ModelAndView mav, HttpServletRequest request) {
			   
			   HttpSession session = request.getSession();
				session.setAttribute("refreshCheck", "no");
			  String seq = request.getParameter("seq");
			  if("no".equals(session.getAttribute("refreshCheck") ) ) {

			      String eduLevel= request.getParameter("eduLevel");
			      String school= request.getParameter("school");
			      String major= request.getParameter("major");
			      
			      EduVO evo = new EduVO();

			         evo.setMbr_seq(Integer.parseInt(seq));
			         evo.setEduLevel(Integer.parseInt(eduLevel));
			         evo.setSchool(school);
			         evo.setMajor(major);

			         // 학력정보 입력하기
			         int n = service.insaRegister2EndEdu(evo);
			         if(n==1) { 
				          System.out.println("등록성공");   
				            List<EduVO> eduList = service.getEduList(seq);
				            List<CertiVO> certiList = service.getCertiList(seq);
				            String maxEduLevel = service.getMaxEduLevel(seq);

				            mav.addObject("eduList", eduList);
				            mav.addObject("maxEduLevel", maxEduLevel);
				            mav.addObject("certiList", certiList);
				            mav.addObject("seq", seq);
				            mav.setViewName("insa/insaRegistser2.tiles1");

				       } 
				       else {
				          System.out.println("등록실패");
				          mav.setViewName("insa/insa.tiles1"); 
				          }
						session.removeAttribute("refreshCheck");
				  }
				  else {
					  List<EduVO> eduList = service.getEduList(seq);
			          List<CertiVO> certiList = service.getCertiList(seq);
			          String maxEduLevel = service.getMaxEduLevel(seq);

			          mav.addObject("eduList", eduList);
			          mav.addObject("maxEduLevel", maxEduLevel);
			          mav.addObject("certiList", certiList);
			          mav.addObject("seq", seq);
			          mav.setViewName("insa/insaRegistser2.tiles1");
				  }

			      return mav;
			   }


			   // === insa2 자격증 등록완료페이지 요청 === //
			      @RequestMapping(value="/insaRegister2CertiEnd.opis", method= {RequestMethod.POST})
			      public ModelAndView insaRegister2CertiEnd(ModelAndView mav, HttpServletRequest request) {
			    	  HttpSession session = request.getSession();
			    		session.setAttribute("refreshCheck", "no");
			           String seq = request.getParameter("seq");

			           if("no".equals(session.getAttribute("refreshCheck") ) ) {

			        	   
			        	   String certification= request.getParameter("certification");
			               String certiLevel= request.getParameter("certiLevel");
			               String year = request.getParameter("certiyy");
			               String month = request.getParameter("certimm");
			               String day = request.getParameter("certidd");
			               
			               CertiVO cvo = new CertiVO();

			               cvo.setMbr_seq(Integer.parseInt(seq));
			               cvo.setCertification(certification);
			               cvo.setCertiLevel(Integer.parseInt(certiLevel));

			               if(Integer.parseInt(month)<10) {
			                  month = "0"+month;
			               }
			               if(Integer.parseInt(day)<10) {
			                  day = "0"+day;
			               }
			               cvo.setCertiDate(year+"-"+month+"-"+day);

			               
			               // 자격증정보 입력하기
			               int m = service.insaRegister2EndCerti(cvo);



			             if(m==1) { 
			                System.out.println("등록성공"); 
			                  List<EduVO> eduList = service.getEduList(seq);
			                  
			                  List<CertiVO> certiList = service.getCertiList(seq);
			                  String maxEduLevel = service.getMaxEduLevel(seq);



			                  mav.addObject("eduList", eduList);
			                  mav.addObject("maxEduLevel", maxEduLevel);
			                  mav.addObject("certiList", certiList);
			                  mav.addObject("seq", seq);
			                  mav.setViewName("insa/insaRegister2.tiles1");
			             } 
			             else {
			                System.out.println("등록실패");
			                mav.setViewName("insa/insa.tiles1"); 
			                }
			  			session.removeAttribute("refreshCheck");
			     	  }
			     	  else {
			  	          List<EduVO> eduList = service.getEduList(seq);

			  	        List<CertiVO> certiList = service.getCertiList(seq);
				          String maxEduLevel = service.getMaxEduLevel(seq);



				          mav.addObject("eduList", eduList);
				          mav.addObject("maxEduLevel", maxEduLevel);
				          mav.addObject("certiList", certiList);
				          mav.addObject("seq", seq);
				          mav.setViewName("insa/insaRegister2.tiles1");

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
			      // 학력 리스트 가져오기
			      List<EduVO> eduList = service.getEduList(seq);
			      // 최종학력 가져오기
			      String maxEduLevel = service.getMaxEduLevel(seq);

			      // 자격증 리스트 가져오기
			      List<CertiVO> certiList = service.getCertiList(seq);
			      
			   // 학력정보 가져오기
			      int n = service.getEduNum(seq);
			      // 자격증정보 가져오기
			      int m = service.getCertiNum(seq);
			      
			      
			      if(n!=0 || m!=0) {
			          mav.addObject("seq", seq);
			          mav.addObject("maxEduLevel", maxEduLevel);
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
