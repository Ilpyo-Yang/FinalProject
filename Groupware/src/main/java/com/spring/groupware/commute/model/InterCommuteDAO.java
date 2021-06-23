package com.spring.groupware.commute.model;


public interface InterCommuteDAO {

	// 출근 등록
	int startWork(CommuteVO cmtvo);

	// 퇴근 등록
	int endWork(CommuteVO cmtvo);

	// 출근상태 조회
	CommuteVO getCmtStatus(String fk_mbr_seq);


}
