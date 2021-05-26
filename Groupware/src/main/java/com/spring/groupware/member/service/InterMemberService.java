package com.spring.groupware.member.service;

import java.util.Map;

import com.spring.groupware.member.model.CompanyVO;

public interface InterMemberService {

	// 로그인 뷰 회사명 가져오기
	String getCompanyName();
	
	// 로그인확인하기
	int loginCheck(String id, String pwd);

	// 회사정보 모두 가져오기
	CompanyVO getCompanyInfo();

	// 대표자 이름 가져오기
	String getCeoName();




	
	
}
