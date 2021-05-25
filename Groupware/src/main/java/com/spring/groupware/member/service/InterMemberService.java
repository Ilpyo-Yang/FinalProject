package com.spring.groupware.member.service;


public interface InterMemberService {

	// 로그인 뷰 회사명 가져오기
	String getCompanyName();
	
	// 로그인확인하기
	int loginCheck(String id, String pwd);




	
	
}
