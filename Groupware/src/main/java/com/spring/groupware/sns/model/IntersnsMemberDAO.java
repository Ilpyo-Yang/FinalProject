package com.spring.groupware.sns.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.groupware.member.model.MemberVO;

public interface IntersnsMemberDAO {

	// 사원리스트 가져오기
	List<MemberVO> getmemberList();

	// 검색어가 있는 유저 목록 가져오기
	List<MemberVO> memberListSearch(Map<String, String> paraMap);

	// 정보수정하기
	int infochange(MemberVO membervo);



}
