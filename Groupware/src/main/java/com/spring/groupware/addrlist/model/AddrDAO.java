package com.spring.groupware.addrlist.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Component
@Repository
public class AddrDAO implements InterAddrDAO {	
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결

}
