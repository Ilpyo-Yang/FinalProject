package com.spring.groupware.commute.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.commute.model.CommuteVO;
import com.spring.groupware.commute.service.InterCommuteService;
import com.spring.groupware.member.model.MemberVO;


@Controller
public class CommuteController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterCommuteService service;

   @RequestMapping(value="/manageCmt.opis")
   public String mngCommute() {
	   
	   return "commute/manageCmt.tiles1";
   }

   // === 개별 근태관리 화면 연결 === //
   @RequestMapping(value="/checkCmt.opis")
   public String requiredLogin_checkCmt(HttpServletRequest request, HttpServletResponse response) {
	   
	   return "commute/checkCmt.tiles1";
   } 
   
   // === 개별 출근 등록 === //
   @RequestMapping(value="/startWork.opis", method= {RequestMethod.POST})
   public ModelAndView startWork(HttpServletRequest request, ModelAndView mav, CommuteVO cmtvo) {
	   
	   HttpSession session = request.getSession();
 	   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
 	  
 	   String startstatus = request.getParameter("startstatus");
 	   String login_mbrseq = null;
 	  
 	   if(loginuser != null) {
 		  login_mbrseq = String.valueOf(loginuser.getMbr_seq());
 	   } 
 	  
// 	   System.out.println("확인용 사원번호 : "+login_mbrseq+" / 확인용 상태 : "+startstatus);
 	   
 	   cmtvo.setFk_mbr_seq(login_mbrseq);
 	   cmtvo.setStartstatus(startstatus);
 	   
 	   int n = service.startWork(cmtvo);

 	   if(n==1) {
		  mav.setViewName("redirect:/checkCmt.opis");		  
	   }
	   else {
		  mav.setViewName("board/error/add_error.tiles1");
	   }
	  
	   return mav;
   }  
   
   // === 개별 퇴근 등록 === //
   @RequestMapping(value="/endWork.opis", method= {RequestMethod.POST})
   public ModelAndView endWork(ModelAndView mav, CommuteVO cmtvo, HttpServletRequest request) {
	   
	   String endstatus = request.getParameter("endstatus");
	   
	   HttpSession session = request.getSession();
       MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
       
       String fk_mbr_seq = String.valueOf(loginuser.getMbr_seq());
       cmtvo = service.getCmtStatus(fk_mbr_seq);
       cmtvo.setEndstatus(endstatus);
       
//      System.out.println("확인용 상태 : "+endstatus+" / "+cmtvo.getFk_mbr_seq()+" ? "+loginuser.getMbr_seq()+" ! "+cmtvo.getStarttime());
       
       
	   if(cmtvo.getStarttime() != null) {
	
		   int n = service.endWork(cmtvo);
		   
		   if(n == 0) {
		         mav.addObject("message", "퇴근 등록을 실패했습니다.");
	       }
	       else {
	    	   	 mav.addObject("message", "퇴근 등록을 완료했습니다.");
	       }

	   }
	   
	   mav.addObject("loc", request.getContextPath()+"/checkCmt.opis");
       mav.setViewName("msg");
   
	   
	   return mav;
   }  
/*   
   @RequestMapping(value="/mngCommute.opis")
   public ModelAndView requiredLogin_mngCommute(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
*/
//	   	  List<String> cmtList = null;	
	   	  
/*	   
	   	  Calendar cal = Calendar.getInstance();
	   	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		  String sysdate = sdf.format(cal.getTime());
		  System.out.println(sysdate);
*/
//	   	  String sysdate="20210601";
//  	  String str_currentShowPageNo = request.getParameter("currentShowPageNo");
  
/* 	  
	 	  int totalCount = 0; 			// 총 게시물 건수
	 	  int sizePerPage = 10;       	// 한 페이지당 보여줄 게시물 건수     	  
	 	  int currentShowPageNo = 0;  	// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정
	 	  int totalPage = 0;          	// 총 페이지수
	 	  
	 	  int startRno = 0;           	// 시작 행번호
	      int endRno = 0;             	// 끝 행번호 
	       
	      // 총 주소록 건수(totalCount)
	      totalCount = service.getTotalCount(paraMap);
	       
	      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);	
	       
	 	  if(str_currentShowPageNo == null) {
	 		  currentShowPageNo = 1;
	 	  }
	 	  else {
	 		  try {
	 			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	 			if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
	 				currentShowPageNo = 1;
	 			}
	 		  } catch (NumberFormatException e) {
					currentShowPageNo = 1;
				}
	 	  }

	 	  
	 	  startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
	      endRno = startRno + sizePerPage - 1;
	 	  
	      paraMap.put("startRno", String.valueOf(startRno));
	      paraMap.put("endRno", String.valueOf(endRno));
*/	       
//	 	  cmtList = service.cmtListWithPaging(sysdate);
	 	  // 페이징 처리한 주소록 목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
		   
/*
	 	  int blockSize = 5;
	 	  int loop=1;
	 	  
	 	  int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;

	 	  String pageBar = "<ul style='list-style: none;'>";
	 	  String url = "totaladdrlist.opis";
	 	  
	 	  // === [맨처음][이전] 만들기 ===
	 	  if(pageNo != 1) {
	 		  pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
	 		  pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
	 	  }
	 	  
	 	  while(!(loop > blockSize || pageNo > totalPage )) {
	 		
	 		  if(pageNo == currentShowPageNo) {
	 			  pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; background-color: #F2F2F2; border-radius: 15px; color:red; padding:2px 4px;'>"+pageNo+"</li>";
	 		  }
	 		  else {
	 			  pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
	 		  }
	 		  
	 		  loop++;
	 		  pageNo++;
	 	  }// end of while----------------------------------
	 	  
	 	  // === [다음][마지막] 만들기 ===
	 	  if(pageNo <= totalPage) {
	 		  pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[다음]</a></li>";
	 		  pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
	 	  }
	 	  
	 	  pageBar += "</ul>";
	 	  
	 	  mav.addObject("pageBar", pageBar);
*/	 	  
/*	 	  String gobackURL = MyUtil.getCurrentURL(request);

	 	  mav.addObject("gobackURL", gobackURL);
	 	  mav.addObject("cmtList", cmtList);
	 	  mav.setViewName("commute/mngCommute.tiles1");
	 	 
	 	  return mav;
   }
*/   
   
   
}