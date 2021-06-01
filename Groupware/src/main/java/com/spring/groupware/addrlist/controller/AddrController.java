package com.spring.groupware.addrlist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groupware.addrlist.model.AddrVO;
import com.spring.groupware.addrlist.service.InterAddrService;
import com.spring.groupware.common.MyUtil;

@Controller
public class AddrController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterAddrService service;
      
   // === 주소록 추가 === //
   @RequestMapping(value="/addr_addEnd.opis", method= {RequestMethod.POST})
   public ModelAndView addEnd(ModelAndView mav, AddrVO addrvo) {
 
 	  int n = service.add(addrvo);
 	  
 	  if(n==1) {
 		  mav.setViewName("redirect:/totaladdrlist.opis");
 		  
 	  }
 	  else {
 		  mav.setViewName("board/error/add_error.tiles1");
 	  }
 	  
 	  return mav;
   }
   
   // === 주소록 목록 === //
   @RequestMapping(value="/totaladdrlist.opis")
   public ModelAndView list(ModelAndView mav, HttpServletRequest request) {

 	  List<AddrVO> addrList = null; 
 	   	  
 	  String searchType = request.getParameter("searchType");
 	  String searchWord = request.getParameter("searchWord");    	  
 	  String str_currentShowPageNo = request.getParameter("currentShowPageNo");
 	  
 	  if(searchType == null || (!"dept".contentEquals(searchType) && !"name".contentEquals(searchType)) ) {
 		  searchType="";
 	  }
 	  
 	  if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty()) {
 		  searchWord="";
 	  }
 	  
 	  Map<String,String> paraMap = new HashMap<>();    	  
 	  paraMap.put("searchType", searchType);
 	  paraMap.put("searchWord", searchWord);
 	  
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
       
 	  addrList = service.addrListSearchWithPaging(paraMap);
 	  // 페이징 처리한 주소록 목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	  
 	  // 검색대상 컬럼과 검색어 유지
 	  if(!"".equals(searchType) && !"".equals(searchWord)) {
 		  mav.addObject("paraMap", paraMap);
 	  }

 	  int blockSize = 5;
 	  int loop=1;
 	  
 	  int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;

 	  String pageBar = "<ul style='list-style: none;'>";
 	  String url = "totaladdrlist.opis";
 	  
 	  // === [맨처음][이전] 만들기 ===
 	  if(pageNo != 1) {
 		  pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo=1'>[맨처음]</a></li>";
 		  pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
 	  }
 	  
 	  while(!(loop > blockSize || pageNo > totalPage )) {
 		
 		  if(pageNo == currentShowPageNo) {
 			  pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";
 		  }
 		  else {
 			  pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
 		  }
 		  
 		  loop++;
 		  pageNo++;
 	  }// end of while----------------------------------
 	  
 	  // === [다음][마지막] 만들기 ===
 	  if(pageNo <= totalPage) {
 		  pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
 		  pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
 	  }
 	  
 	  pageBar += "</ul>";
 	  
 	  mav.addObject("pageBar", pageBar);
 	  
 	  String gobackURL = MyUtil.getCurrentURL(request);

 	  mav.addObject("gobackURL", gobackURL);
 	  mav.addObject("addrList", addrList);
 	  mav.setViewName("addrlist/totaladdrlist.tiles1");
 	 
 	  return mav;
   }
   
   // === 주소록 검색 === //
   @ResponseBody
   @RequestMapping(value="/wordSearchShow.opis", produces="text/plain;charset=UTF-8")
   public String wordSearchShow(HttpServletRequest request) {
	   
 	  String searchType = request.getParameter("searchType");
 	  String searchWord = request.getParameter("searchWord");
 	  
 	  Map<String,String> paraMap = new HashMap<>();
 	  paraMap.put("searchType",searchType);
 	  paraMap.put("searchWord",searchWord);
 	  
 	  List<String> wordList = service.wordSearchShow(paraMap);
 	  
 	  JSONArray jsonArr = new JSONArray();
 	  
 	  if(wordList != null) {
 		  for(String word : wordList) {
 			  JSONObject jsonObj = new JSONObject();
 			  jsonObj.put("word", word); 
 			  
 			  jsonArr.put(jsonObj);
 		  }
 	  }
 	  
 	  return jsonArr.toString();
   }
   
   // === 주소록 1개를 보여주는 페이지 요청 === //
   @RequestMapping(value="/addr_view.opis")
   public ModelAndView view(HttpServletRequest request, ModelAndView mav) {
 	  
 	  // 조회하고자 하는 주소혹 번호 받아오기
 	  String addr_seq = request.getParameter("addr_seq");

 	  AddrVO addrvo = service.getView(addr_seq);

 	  mav.addObject("addrvo", addrvo);
 	  mav.setViewName("addrlist/addr_view.tiles1");
 	  
 	  return mav;
   }  
   
   // === 주소록 수정 페이지 요청 === //
   @RequestMapping(value="/addr_edit.opis")
//   public ModelAndView requiredLogin_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
   public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

 	  // 수정해야 할 글번호 가져오기
 	  String addr_seq = request.getParameter("addr_seq");
 	  
 	  // 글조회수(readCount) 증가 없이 단순히 글1개만 조회 해주는 것이다.
 	  AddrVO addrvo = service.getView(addr_seq);

// 	  HttpSession session = request.getSession();
//     MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
       
/*        if( loginuser.getFk_power_no() == 0 ) {
          String message = "관리자 외 수정 불가합니다.";
          String loc = "javascript:history.back()";
          
          mav.addObject("message", message);
          mav.addObject("loc", loc);
          mav.setViewName("msg");
       }
       else {	*/
     	 // 자신의 글을 수정할 경우
     	 // 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
     	 mav.addObject("addrvo", addrvo);
     	 mav.setViewName("addrlist/addr_edit.tiles1");

//       }
 	  return mav;
   }
   
   // === 주소록 수정 페이지 완료하기 === //
   @RequestMapping(value="/addr_editEnd.opis", method= {RequestMethod.POST})
   public ModelAndView editEnd(ModelAndView mav, AddrVO addrvo, HttpServletRequest request) {
 	  
 	  int n = service.edit(addrvo);
 	  // n 이 1 이라면 정상적으로 변경됨, n 이 0 이라면 글수정에 필요한 글암호가 틀린경우 
 	  
 	  if(n == 0) {
	         mav.addObject("message", "주소록 정보 수정을 실패했습니다.");
	      }
	      else {
	         mav.addObject("message", "주소록 정보를 성공적으로 수정했습니다.");
	      }
	  
       mav.addObject("loc", request.getContextPath()+"/addr_view.opis?addr_seq="+addrvo.getAddr_seq());
       mav.setViewName("msg");
 	  
       return mav;
   }

   // === 주소록 삭제  === // 
   @RequestMapping(value="/addr_delEnd.opis", method= {RequestMethod.GET})
   public ModelAndView delEnd(ModelAndView mav, HttpServletRequest request) {
 	  
 	  // 삭제해야 할 주소록 번호 가져오기
 	  String addr_seq = request.getParameter("addr_seq");
       
       Map<String,String> paraMap = new HashMap<>();
       paraMap.put("addr_seq", addr_seq);
       
       int n = service.del(paraMap); 
       // n 이 1 이라면 정상적으로 삭제, n 이 0 이라면 글삭제 실패
       
       if(n == 0) {
           mav.addObject("message", "주소록 정보 삭제를 실패했습니다.");
           mav.addObject("loc", request.getContextPath()+"/addr_view.opis?addr_seq="+addr_seq);
       }
       else {
          mav.addObject("message", "주소록 정보를 성공적으로 삭제했습니다.");
          mav.addObject("loc", request.getContextPath()+"/totaladdrlist.opis");
       }
       
       mav.setViewName("msg");

       return mav;
   }
   
}