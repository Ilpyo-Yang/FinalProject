package com.spring.groupware.member.model;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;


@Component
@Repository
public class MemberDAO implements InterMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 원격 DB에 연결
	
	// 로그인 뷰 회사명 가져오기
	@Override
	public String getCompanyName() {
		String com_name = sqlsession.selectOne("member.companyName_select");		
		return com_name;
	}

	// 회사정보 모두 가져오기
	@Override
	public CompanyVO getCompanyInfo() {
		CompanyVO cvo = sqlsession.selectOne("member.companyInfo_select");		
		return cvo;
	}

	// 대표이름 가져오기
	@Override
	public String getCeoName() { 
		String ceo_name = sqlsession.selectOne("member.ceoName_select");
		return ceo_name;
	}

}
