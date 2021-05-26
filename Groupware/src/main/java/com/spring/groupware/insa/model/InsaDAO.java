package com.spring.groupware.insa.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.groupware.member.model.MemberVO;
@Component
@Repository
public class InsaDAO implements InterInsaDAO {



	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결
	
	// 인사정보 등록하기
	@Override
	public int insaRegister1End(MemberVO membervo) {
		/* int n = sqlsession.insert("insa.insaRegisterEnd", membervo); */
		return 1;
	}

}
