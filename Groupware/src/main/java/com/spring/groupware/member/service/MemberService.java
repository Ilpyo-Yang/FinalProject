package com.spring.groupware.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

// import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.member.model.CompanyVO;
import com.spring.groupware.member.model.InterMemberDAO;


@Component
@Service
public class MemberService implements InterMemberService {
	
	// 의존객체 주입
	@Autowired
	private InterMemberDAO mdao;

	// 로그인 뷰 회사명 가져오기
	@Override
	public String getCompanyName() {
		String com_name = mdao.getCompanyName();
		return com_name;
	}

	// 로그인 확인하기
	@Override
	public int loginCheck(String id, String pwd) {
		
		return 0;
	}


	// 회사정보 모두 가져오기
	@Override
	public CompanyVO getCompanyInfo() {
		CompanyVO cvo = mdao.getCompanyInfo();
		return cvo;
	}

	// 대표이름 가져오기
	@Override
	public String getCeoName() {
		String ceo_name = mdao.getCeoName();
		return ceo_name;
	}


	
	
	
	
	
	
}
