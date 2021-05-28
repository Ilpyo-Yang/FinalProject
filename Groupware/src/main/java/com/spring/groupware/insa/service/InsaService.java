package com.spring.groupware.insa.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

// import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.insa.model.InsaDAO;
import com.spring.groupware.insa.model.InterInsaDAO;
import com.spring.groupware.member.model.MemberVO;


//=== #31. Service 선언 === 
//트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단
@Component
@Service
public class InsaService implements InterInsaService {

	@Autowired
	private InterInsaDAO idao;

	
	// 인사정보 등록하기
	
	@Override
	public int insaRegister1End(MemberVO membervo) {
		int n = idao.insaRegister1End(membervo);
		return n;
	}


	@Override
	public List<MemberVO> getMemberList(String category) {
		List<MemberVO> memberList = idao.getMemberList(category);
		return memberList;
	}

	
	

	
	
	
	
	
}
