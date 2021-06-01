package com.spring.groupware.sns.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.member.model.MemberVO;
import com.spring.groupware.sns.model.IntersnsMemberDAO;

@Component
@Service
public class snsMemberService implements IntersnsMemberService {

	@Autowired
	private IntersnsMemberDAO dao;
	
	// 유저 목록 불러오기
	@Override
	public List<MemberVO> getmemberList() {
		
		List<MemberVO> memberList = dao.getmemberList();
		
		return memberList;
	}

	// 검색어가 있는 유저목록 불러오기
	@Override
	public List<MemberVO> memberListSearch(Map<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberListSearch(paraMap);
		return memberList;
	}

	// 정보 수정하기
	@Override
	public int infochange(MemberVO membervo) {
		int n = dao.infochange(membervo);
		return n;
	}



}
