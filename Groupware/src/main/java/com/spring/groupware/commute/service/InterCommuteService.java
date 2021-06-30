package com.spring.groupware.commute.service;



import com.spring.groupware.commute.model.CommuteVO;

public interface InterCommuteService {

	// 출근 등록
	int startWork(CommuteVO cmtvo);

	// 퇴근 등록
	int endWork(CommuteVO cmtvo);

	// 출근 상태 조회
	CommuteVO getCmtStatus(String fk_mbr_seq);

	
}
