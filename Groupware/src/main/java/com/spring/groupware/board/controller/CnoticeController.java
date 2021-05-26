package com.spring.groupware.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.board.model.CnoticeVO;
import com.spring.groupware.board.service.InterCnoticeService;
import com.spring.groupware.member.model.MemberVO;

@Controller
public class CnoticeController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterCnoticeService service;
      
      // === 게시판 글쓰기 폼 페이지 요청 === //
      @RequestMapping(value="/add.opis")
//    public ModelAndView requiredLogin_add(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
      public ModelAndView add(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
    	  
    	  mav.setViewName("board/add.tiles1");
    	  
    	  return mav;
      }
      
      
      // === 게시판 글쓰기 폼 페이지 요청 === //
      @RequestMapping(value="/cnotice_addEnd.opis", method= {RequestMethod.POST})
      public ModelAndView addEnd(ModelAndView mav, CnoticeVO cnoticevo) {
    	  

    	  int n = service.add(cnoticevo); // <== 파일첨부가 없는 글쓰기
    	  
    	  if(n==1) {
    		  mav.setViewName("redirect:/cnotice_list.opis");
    		  
    	  }
    	  else {
    		  mav.setViewName("board/error/add_error.tiles1");
    	  }
    	  
    	  return mav;
      }
  
      
      // === 글목록 보기 페이지 요청 === //
      @RequestMapping(value="/cnotice_list.opis")
      public ModelAndView list(ModelAndView mav, HttpServletRequest request) {
    	  
    	  List<CnoticeVO> boardList = null; 
    	  
    	  // == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
    	  boardList = service.boardListNoSearch();
    	  

    	  HttpSession session = request.getSession();
    	  session.setAttribute("readCountPermission", "yes");

    	  mav.addObject("boardList", boardList);
    	  mav.setViewName("board/cnotice_list.tiles1");
    	  
    	  return mav;
      }
      
      // === 글1개를 보여주는 페이지 요청 === //
      @RequestMapping(value="/cnotice_view.opis")
      public ModelAndView view(HttpServletRequest request, ModelAndView mav) {
    	  
    	  // 조회하고자 하는 글번호 받아오기
    	  String cnotice_seq = request.getParameter("cnotice_seq");
    	  
    	  String login_mbrid = null;
    	  
    	  HttpSession session = request.getSession();
    	  MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
    	  
    	  if(loginuser != null) {
    		  login_mbrid = loginuser.getMbr_id();
    		  
    	  }   	  
    	  
    	  CnoticeVO cnoticevo = null;
    	  
    	  if("yes".equals(session.getAttribute("readCountPermission"))) {// 글목록보기를 클릭한 다음에 특정글을 조회해온 경우
    		
    		  cnoticevo = service.getView(cnotice_seq, login_mbrid);
        	  // 글조회수 증가와 함께 글1개를 조회
        	  
    		  session.removeAttribute("readCountPermission");
    		  // session 에 저장된 readCountPermission 을 삭제
    	  }
    	  else {// 웹브라우저에서 새로고침(F5)을 클릭한 경우    		  
    		  cnoticevo = service.getViewWithNoAddCount(cnotice_seq);
    		  // 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
    	  }
    	  
    	  mav.addObject("cnoticevo", cnoticevo);
    	  mav.setViewName("board/cnotice_view.tiles1");
    	  
    	  return mav;
      }

      @ExceptionHandler(java.lang.Throwable.class)
      public void handleThrowable(Throwable e, HttpServletRequest request, HttpServletResponse response) {
         
         try {
            response.setContentType("text/html; charset=UTF-8");
            
            PrintWriter out = response.getWriter();
            
            out.println("<html>");
            out.println("<head><title>오류메시지 출력하기</title></head>");
            out.println("<body>");
            out.println("<h1>오류발생</h1>");
            out.printf("<div><span style='font-weight: bold;'>오류메시지</span><br><span style='color: red;'>%s</span></div>", e.getMessage());
            out.printf("<div style='margin: 20px; color: blue; font-weight: bold; font-size: 26pt;'>%s</div>", "장난금지");
            out.println("<a href='/board/index.action'>홈페이지로 가기</a>");
            out.println("</body>");
            out.println("</html>");
            

         } catch (IOException e1) {
            e1.printStackTrace();
         }
         
      }
      
      // === 글삭제 페이지 요청 === //
      @RequestMapping(value="/cnotice_del.opis")
      public ModelAndView requiredLogin_del(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
    	  
    	  // 삭제해야 할 글번호 가져오기
    	  String cnotice_seq = request.getParameter("cnotice_seq");
    	  
    	  CnoticeVO cnoticevo = service.getViewWithNoAddCount(cnotice_seq);
    	  // 글조회수(readCount) 증가 없이 단순히 글1개만 조회 해주는 것이다.
    	  
    	  HttpSession session = request.getSession();
          MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
          
          if( loginuser.getMbr_id().equals("admin") ) { // 로그인한 유저가 관리자일 때만
             
        	  mav.addObject("cnotice_seq", cnotice_seq);
        	  mav.setViewName("board/cnotice_del.tiles1");
        	  
          }
    	  return mav;
      }
      
      // === 글삭제 페이지 완료 === // 
      @RequestMapping(value="/cnotice_delEnd.opis", method= {RequestMethod.POST})
      public ModelAndView delEnd(ModelAndView mav, HttpServletRequest request) {
    	  

    	  String cnotice_seq = request.getParameter("cnotice_seq");
          
          Map<String,String> paraMap = new HashMap<>();
          paraMap.put("cnotice_seq", cnotice_seq);
          
          int n = service.del(paraMap); 
          // n 이 1 이라면 정상적으로 삭제
          // n 이 0 이라면 글삭제 실패
          
          if(n == 0) {
              mav.addObject("message", "글 삭제를 실패했습니다.");
              mav.addObject("loc", request.getContextPath()+"/view.opis");
          }
          else {
             mav.addObject("message", "글삭제 성공!!");
             mav.addObject("loc", request.getContextPath()+"/list.opis");
          }
          
    	  return mav;
      }
}