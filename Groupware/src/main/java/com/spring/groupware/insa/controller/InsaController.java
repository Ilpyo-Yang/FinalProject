package com.spring.groupware.insa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.spring.groupware.insa.service.InsaService;
import com.spring.groupware.insa.service.InterInsaService;
import com.spring.groupware.insa.model.CertiVO;
import com.spring.groupware.insa.model.EduVO;
import com.spring.groupware.insa.model.InsaVO;
import com.spring.groupware.insa.model.PayInfoVO;
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


		// === insa2 등록페이지 요청 === //
		   @RequestMapping(value="/insaRegister2.opis")
		   public ModelAndView insaRegister2(ModelAndView mav, HttpServletRequest request) {

		      String seq = request.getParameter("seq");
		      String insaType = request.getParameter("insaType");
		      String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

		      System.out.println("항 => "+seq);

		      List<EduVO> eduList = service.getEduList(seq);
		      List<CertiVO> certiList = service.getCertiList(seq);

		      mav.addObject("insaType", insaType);
		      mav.addObject("eduList", eduList);
		      mav.addObject("certiList", certiList);
		      mav.addObject("maxEduLevel", maxEduLevel);
		      mav.addObject("seq", seq);

		      mav.setViewName("insa/insaRegister2.tiles1");
		      return mav;
		   }


		   // === insa2  학력 등록완료페이지 요청 === //
		   @RequestMapping(value="/insaRegister2EduEnd.opis", method= {RequestMethod.POST})
		   public ModelAndView insaRegister2EduEnd(ModelAndView mav, HttpServletRequest request) {
			   
			  String seq = request.getParameter("seq");

			      String eduLevel= request.getParameter("eduLevel");
			      String school= request.getParameter("school");
			      String major= request.getParameter("major");
			      
			      EduVO evo = new EduVO();

			         evo.setMbr_seq(Integer.parseInt(seq));
			         evo.setEduLevel(Integer.parseInt(eduLevel));
			         evo.setSchool(school);
			         evo.setMajor(major);

			         
			         // 학력번호 가져오기
			         int edu_seq = service.getEduSeq();
			         evo.setEdu_seq(edu_seq);
			         
			         System.out.println("eduseq => "+evo.getEdu_seq());
			         
			         // 학력정보 입력하기
			         int n = service.insaRegister2EndEdu(evo);
			         if(n==1) { 
				          System.out.println("등록성공");   
				            List<EduVO> eduList = service.getEduList(seq);
				            List<CertiVO> certiList = service.getCertiList(seq);
				            String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

				            mav.addObject("eduList", eduList);
				            mav.addObject("maxEduLevel", maxEduLevel);
				            mav.addObject("certiList", certiList);
				            mav.addObject("seq", seq);
				            mav.setViewName("insa/insaView2.tiles1");

				       } 
				       else {
				          System.out.println("등록실패");
				          mav.setViewName("insa/insa.tiles1"); 
				          }
			
			      return mav;
			   }


		   // === insa2 자격증 등록완료페이지 요청 === //
		      @RequestMapping(value="/insaRegister2CertiEnd.opis", method= {RequestMethod.POST})
		      public ModelAndView insaRegister2CertiEnd(ModelAndView mav, HttpServletRequest request) {
		
		           String seq = request.getParameter("seq");

		        	   
		        	   String certification= request.getParameter("certification");
		               String certiLevel= request.getParameter("certiLevel");
		               String year = request.getParameter("certiyy");
		               String month = request.getParameter("certimm");
		               String day = request.getParameter("certidd");
		               
		               CertiVO cvo = new CertiVO();

		               cvo.setMbr_seq(Integer.parseInt(seq));
		               cvo.setCertification(certification);
		               cvo.setCertiLevel(certiLevel);

		               if(Integer.parseInt(month)<10) {
		                  month = "0"+month;
		               }
		               if(Integer.parseInt(day)<10) {   
		                  day = "0"+day;
		               }
		               cvo.setCertiDate(year+"-"+month+"-"+day);
		               
		               // 자격증번호 가져오기
				         int certi_seq = service.getCertiSeq();
				         cvo.setCerti_seq(certi_seq);
				         
				         System.out.println("certiseq => "+cvo.getCerti_seq());
		               
		               // 자격증정보 입력하기
		               int m = service.insaRegister2EndCerti(cvo);



		             if(m==1) { 
		                System.out.println("등록성공"); 
		                  List<EduVO> eduList = service.getEduList(seq);
		                  
		                  List<CertiVO> certiList = service.getCertiList(seq);
		                  String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));



		                  mav.addObject("eduList", eduList);
		                  mav.addObject("maxEduLevel", maxEduLevel);
		                  mav.addObject("certiList", certiList);
		                  mav.addObject("seq", seq);
		                  mav.setViewName("insa/insaView2.tiles1");
		             } 
		             else {
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
			   
			   
			// === insa2 학력 삭제 요청 === //
			   @RequestMapping(value="/insaEduDel.opis")
			   public ModelAndView insaEduDel(ModelAndView mav, HttpServletRequest request) {
				   		
				   String edu_seq = request.getParameter("edu_seq");
				   String seq = request.getParameter("seq");
				   
				   // 학력 삭제하기
				   int n = service.insaEduDel(edu_seq);
			   
				   if(n==1) {
					  System.out.println("삭제성공");
				         mav.setViewName("redirect:/insaView2.opis?seq="+seq);
				   }
				   else {
					  System.out.println("삭제실패");
				         mav.setViewName("redirect:/insaView2.opis?seq="+seq);
				   }
				   
				   return mav;
			   }

			   
			   
			// === insa2 자격증 삭제 요청 === //
			   @RequestMapping(value="/insaCertiDel.opis")
			   public ModelAndView insaCertiDel(ModelAndView mav, HttpServletRequest request) {
				   		
				   String certi_seq = request.getParameter("certi_seq");
				   String seq = request.getParameter("seq");
				   
				   // 자격증 삭제하기
				   int n = service.insaCertiDel(certi_seq);
			   
				   if(n==1) {
					  System.out.println("삭제성공");
				         mav.setViewName("redirect:/insaView2.opis?seq="+seq);
				   }
				   else {
					  System.out.println("삭제실패");
				         mav.setViewName("redirect:/insaView2.opis?seq="+seq);
				   }
				   
				   return mav;
			   }
				   
			   
			   // === insa view2페이지 요청 === //
			   @RequestMapping(value="/insaView2.opis")
			   public ModelAndView insaView2(ModelAndView mav, HttpServletRequest request) {
			      String seq = request.getParameter("seq");
			      // 학력 리스트 가져오기
			      List<EduVO> eduList = service.getEduList(seq);

			      // 자격증 리스트 가져오기
			      List<CertiVO> certiList = service.getCertiList(seq);
			      
			     // 학력정보 가져오기
			      int n = service.getEduNum(seq);
			      // 자격증정보 가져오기
			      int m = service.getCertiNum(seq);
			      
			      String maxEduLevel= "";
			      if(n!=0) {
				      // 최종학력 가져오기
			    	  maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));
			      }
			      else {
			    	  maxEduLevel = "7"; 
			      }
			          mav.addObject("seq", seq);
			          mav.addObject("maxEduLevel", maxEduLevel);
			          mav.addObject("eduList", eduList);
			          mav.addObject("certiList",certiList);
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
			       List <InsaVO> insaList = service.getInsaList(category);
			       mav.addObject("category", category);
			       mav.addObject("insaList", insaList);
			       
			       
			       mav.setViewName("insa/payment.tiles1");
			       return mav;
			    }
			    
		
			 // === insa 학력 수정 요청 === //
		   @RequestMapping(value="/insaEduModi.opis")
		   public ModelAndView insaEduModi(ModelAndView mav, HttpServletRequest request) {
			    
			   String edu_seq = request.getParameter("edu_seq");
			   String seq = request.getParameter("seq");

		       String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

		       List<EduVO> eduList = service.getEduList(seq);
		       List<CertiVO> certiList = service.getCertiList(seq);
		       
			   // 학력정보 가져오기
			   EduVO evo = service.getEduInfo(edu_seq);

		       mav.addObject("evo", evo);
	           mav.addObject("edu_seq", edu_seq);
	           mav.addObject("seq", seq);
	           mav.addObject("maxEduLevel", maxEduLevel);
	           mav.addObject("eduList", eduList);
	           mav.addObject("certiList",certiList);
		       mav.setViewName("insa/eduModify.tiles1");
			   
			   return mav;
		   }
			
		   
		   
		   // === insa2  학력 수정완료페이지 요청 === //
		   @RequestMapping(value="/eduModifyEnd.opis", method= {RequestMethod.POST})
		   public ModelAndView eduModifyEnd(ModelAndView mav, HttpServletRequest request) {
			   
			  String seq = request.getParameter("seq");
			  String edu_seq = request.getParameter("edu_seq");

		      String eduLevel= request.getParameter("eduLevel");
		      String school= request.getParameter("school");
		      String major= request.getParameter("major");
		      
		      EduVO evo = new EduVO();

		      evo.setEdu_seq(Integer.parseInt(edu_seq));
	          evo.setMbr_seq(Integer.parseInt(seq));
	          evo.setEduLevel(Integer.parseInt(eduLevel));
	          evo.setSchool(school);
	          evo.setMajor(major);

	         
	                 
	          // 학력정보 수정하기
	          int n = service.eduModify(evo);
	          if(n==1) { 
		          System.out.println("수정성공");   
		          List<EduVO> eduList = service.getEduList(seq);
		          List<CertiVO> certiList = service.getCertiList(seq);
		          String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

		          mav.addObject("eduList", eduList);
		          mav.addObject("maxEduLevel", maxEduLevel);
		          mav.addObject("certiList", certiList);
		          mav.addObject("seq", seq);
		          mav.setViewName("insa/insaView2.tiles1");

		       } 
		       else {
		          System.out.println("수정실패");
		          mav.setViewName("insa/insa.tiles1"); 
		          }
	
			      return mav;
			   }		   

		   

		   
		    
			
				 // === insa 자격증 수정 요청 === //
			   @RequestMapping(value="/insaCertiModi.opis")
			   public ModelAndView insaCertiModi(ModelAndView mav, HttpServletRequest request) {
				    
				   String certi_seq = request.getParameter("certi_seq");
				   String seq = request.getParameter("seq");

			       String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

			       List<EduVO> eduList = service.getEduList(seq);
			       List<CertiVO> certiList = service.getCertiList(seq);
			       
				   // 자격증 정보 가져오기
				   CertiVO cvo = service.getCertiInfo(certi_seq);
				   
				   String certiyy = cvo.getCertiDate().substring(0, 4);
				   String certimm = cvo.getCertiDate().substring(5, 7);
				   String certidd = cvo.getCertiDate().substring(8, 10);
				   
			       mav.addObject("cvo", cvo);
		           mav.addObject("certi_seq", certi_seq);
		           mav.addObject("seq", seq);
		           mav.addObject("maxEduLevel", maxEduLevel);
		           mav.addObject("certiyy", certiyy);
		           mav.addObject("certimm", certimm);
		           mav.addObject("certidd", certidd);
		           mav.addObject("eduList", eduList);
		           mav.addObject("certiList",certiList);
			       mav.setViewName("insa/certiModify.tiles1");
				   
				   return mav;
			   }
				
			   
			   
			   // === insa2  자격증 수정완료페이지 요청 === //
			   @RequestMapping(value="/certiModifyEnd.opis", method= {RequestMethod.POST})
			   public ModelAndView certiModifyEnd(ModelAndView mav, HttpServletRequest request) {
				   
				  String seq = request.getParameter("seq");
				  String certi_seq = request.getParameter("certi_seq");

				  String certification = request.getParameter("certification");
				  String certiLevel = request.getParameter("certiLevel");
				  String year = request.getParameter("certiyy");
	              String month = request.getParameter("certimm");
	              String day = request.getParameter("certidd");
	               
	              CertiVO cvo = new CertiVO();

	    	      cvo.setCerti_seq(Integer.parseInt(certi_seq));
	              cvo.setMbr_seq(Integer.parseInt(seq));
	              cvo.setCertification(certification);
	              cvo.setCertiLevel(certiLevel);

	              if(Integer.parseInt(month)<10) {
	                  month = "0"+month;
	              }
	              if(Integer.parseInt(day)<10) {   
	                  day = "0"+day;
	              }
	              cvo.setCertiDate(year+"-"+month+"-"+day);


		
		                 
		          // 자격증정보 수정하기
		          int n = service.certiModify(cvo);
		          if(n==1) { 
			          System.out.println("수정성공");   
			          List<EduVO> eduList = service.getEduList(seq);
			          List<CertiVO> certiList = service.getCertiList(seq);
			          String maxEduLevel = String.valueOf(service.getMaxEduLevel(seq));

			          mav.addObject("eduList", eduList);
			          mav.addObject("maxEduLevel", maxEduLevel);
			          mav.addObject("certiList", certiList);
			          mav.addObject("seq", seq);
			          mav.setViewName("insa/insaView2.tiles1");

			       } 
			       else {
			          System.out.println("수정실패");
			          mav.setViewName("insa/insa.tiles1"); 
			          }
		
				      return mav;
				   }		   
			   
			   
			   
		    // === 급여 상세 페이지 요청 === //
		    @RequestMapping(value="/paymentDetail.opis")
		    public ModelAndView paymentDetail(ModelAndView mav, HttpServletRequest request) {

		       String seq = request.getParameter("seq");
		       String category = request.getParameter("category");

		       // 개인별 급여 상세 리스트 가져오기
		       List <PaymentVO> paymentList = service.getPaymentList(seq);
		       
		       // 개인 인사정보 가져오기
		       InsaVO insavo = service.getInsaView1(seq);

		       mav.addObject("category", category);
		       mav.addObject("paymentList", paymentList);
		       mav.addObject("insavo", insavo);

		       mav.setViewName("insa/paymentDetail.tiles1");
		       return mav;
		    }
		    

			   
		    // === 급여 상세 페이지 요청 === //
		    // 개인별 급여 정보 등록 완료		 
			@ResponseBody   
		    @RequestMapping(value="/memberPayInfo.opis", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
		    public String memberPayInfo(HttpServletRequest request) {

		       String seq = request.getParameter("seq");


		       // 개인별 급여 정보 가져오기
		       PayInfoVO pivo = service.getPayInfo(seq);
		       // 개인별 이달 급여 정보 가져오기
		       PaymentVO pvo = service.getPayment(seq);
		       
		       // 개인별 급여 상세 리스트 가져오기
		       List <PaymentVO> paymentList = service.getPaymentList(seq);
		       
		       // 개인 인사정보 가져오기
		       InsaVO insavo = service.getInsaView1(seq);

		       JSONObject jsonObj = new JSONObject();
		       if(pivo != null) {
				   jsonObj.put("bank", pivo.getBank());
				   jsonObj.put("accountNo", pivo.getAccountNo());
				   jsonObj.put("idNo", pivo.getIdNo());
				   jsonObj.put("status", 1);
		       }
		       else {
				   jsonObj.put("bank", "");
				   jsonObj.put("accountNo", "");
				   jsonObj.put("idNo", "");
				   jsonObj.put("status", 0);
		       }
		      
		       if(pvo != null) {
					   jsonObj.put("basePay", pvo.getBASEPAY());
					   jsonObj.put("spePay", pvo.getSPEPAY());
			       }
			       else {
			    	  // System.out.println("모모");
					   jsonObj.put("basePay", "");
					   jsonObj.put("spePay", "");
			       }

			   jsonObj.put("mbr_name", insavo.getMbr_name());
		       return jsonObj.toString();
		    }
		     

		    // 개인별 급여 정보 등록 완료	
			@ResponseBody   
		    @RequestMapping(value="/payRegisterEnd.opis", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
		    public String payRegisterEnd(ModelAndView mav, HttpServletRequest request, PayInfoVO pivo) {

		       String seq = request.getParameter("seq");
		       String idNo = request.getParameter("idNo");
		       String accountNo = request.getParameter("accountNo");
		       String bank = request.getParameter("bank");
		       
		       pivo.setMbr_seq(Integer.parseInt(seq));
		       pivo.setIdNo(idNo);
		       pivo.setAccountNo(accountNo);
		       pivo.setBank(bank);
		       
		       // 개인 급여 정보 등록하기
		       int n = service.payRegister(pivo);
		       
		       String result = "";
		       if(n==1) {
		    	   result = "1";
		       }
		       else {
		    	   result = "2";
		       }
		       
		       return result;
		    }
		    
			
			// 개인별 급여 정보 수정 완료	
			@ResponseBody   
		    @RequestMapping(value="/payModifyEnd.opis", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
		    public String payModifyEnd(ModelAndView mav, HttpServletRequest request, PayInfoVO pivo) {

		       String seq = request.getParameter("seq");
		       String idNo = request.getParameter("idNo");
		       String accountNo = request.getParameter("accountNo");
		       String bank = request.getParameter("bank");
		       
		       pivo.setMbr_seq(Integer.parseInt(seq));
		       pivo.setIdNo(idNo);
		       pivo.setAccountNo(accountNo);
		       pivo.setBank(bank);
		       
		       // 개인 급여 정보 수정하기
		       int n = service.payModify(pivo);
		       
		       String result = "";
		       if(n==1) {
		    	   result = "1";
		       }
		       else {
		    	   result = "2";
		       }
		       
		       return result;
		    }
			
			
			
			
			// 개인별 급여 정보 삭제 완료	
			@ResponseBody   
		    @RequestMapping(value="/payDelEnd.opis", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
		    public String payDelEnd(ModelAndView mav, HttpServletRequest request, PayInfoVO pivo) {

		       String seq = request.getParameter("seq");
		       
		       
		       // 개인 급여 정보 삭제하기
		       int n = service.payDel(seq);
		       
		       String result = "";
		       if(n==1) {
		    	   result = "1";
		       }
		       else {
		    	   result = "2";
		       }
		       
		       return result;
		    }			
			
	}
