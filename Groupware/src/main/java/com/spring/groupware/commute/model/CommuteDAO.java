package com.spring.groupware.commute.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Component
@Repository
public class CommuteDAO implements InterCommuteDAO {	
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결

	// === 출근 등록 === //
	@Override
	public int startWork(CommuteVO cmtvo) {
		int n = sqlsession.insert("commute.startWork", cmtvo);
		return n;
	}

	// === 퇴근 등록 === //
	@Override
	public int endWork(CommuteVO cmtvo) {
		int n = sqlsession.update("commute.endWork", cmtvo);
		return n;
	}

	// === 출근상태 조회 === //
	@Override
	public CommuteVO getCmtStatus(String fk_mbr_seq) {
		CommuteVO cmtvo = sqlsession.selectOne("commute.getCmtStatus", fk_mbr_seq);
		return cmtvo;
	}




}
