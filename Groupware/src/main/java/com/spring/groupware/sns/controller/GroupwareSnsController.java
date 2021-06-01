package com.spring.groupware.sns.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.sns.service.IntersnsMemberService;


@Component
@Controller
public class GroupwareSnsController {

	@Autowired	// Type에 따라 알아서 Bean 을 주입해준다.
	private IntersnsMemberService service;
	
	// sns메인페이지 요청
	@RequestMapping(value="/sns/snsmain.opis")
	public ModelAndView requiredLogin_sns_main(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		List<MemberVO> memberList = null;
		
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null || "".equals(searchWord) || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchWord", searchWord);
				
		memberList = service.memberListSearch(paraMap);
		
		// 아래는 검색대상 컬럼과 검색어를 유지시키기 위한 것임.
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("memberList", memberList);
		mav.setViewName("sns/snsmain");
		
		return mav;
	}
	
	// 대화방 요청
	@RequestMapping(value="/sns/snstalkroom.opis")
	public ModelAndView requiredLogin_snstalkroom(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		
		
		mav.setViewName("sns/talkroom");
		return mav;
	}
	
	// 글 수정 페이지 요청하기
	@RequestMapping(value="/sns/infochange.opis")
	public ModelAndView requiredLogin_infochange(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("sns/infochange");
		return mav;
	}
	
}
