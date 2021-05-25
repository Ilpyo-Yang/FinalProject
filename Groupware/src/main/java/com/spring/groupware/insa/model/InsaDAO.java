package com.spring.groupware.insa.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.groupware.member.model.MemberVO;

public class InsaDAO implements InterInsaDAO {


	  @Resource
	  private SqlSessionTemplate sqlsession; 
	
	// 인사정보 등록하기
	@Override
	public int insaRegisterEnd(MemberVO membervo) {
		/* int n = sqlsession.insert("insa.insaRegisterEnd", membervo); */
		return 1;
	}

}
