package com.spring.groupware.sns.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.member.model.MemberVO;

public interface IntersnsMemberService {

	// 유저목록 불러오기
	List<MemberVO> getmemberList();

	// 검색어가 있는 유저목록 불러오기
	List<MemberVO> memberListSearch(Map<String, String> paraMap);

	// 정보수정하기
	int infochange(MemberVO membervo);


	
}
