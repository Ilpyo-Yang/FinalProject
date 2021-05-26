package com.spring.groupware.insa.service;

import java.util.List;

import com.spring.groupware.member.model.MemberVO;

public interface InterInsaService {
	// 인사정보 등록하기
	int insaRegister1End(MemberVO membervo);

	List<MemberVO> getMemberList(String category);



	
	
}
