package com.spring.groupware.member.model;

import java.util.Map;

public interface InterMemberDAO {

	// 로그인 뷰 회사명 가져오기
	String getCompanyName();

	// 회사정보 모두 가져오기
	CompanyVO getCompanyInfo();

	// 대표이름 가져오기
	String getCeoName();

	// 관리자 정보 가져오기
	MemberVO getAdminInfo();

	// 로그인 확인하기
	MemberVO loginCheck(Map<String, String> paraMap);

}
