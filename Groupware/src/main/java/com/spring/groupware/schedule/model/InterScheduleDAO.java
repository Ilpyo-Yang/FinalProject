package com.spring.groupware.schedule.model;

public interface InterScheduleDAO {
	
	// 일정 등록하기
	int scdAdd(ScheduleVO schedulevo);
	
	// 등록된 일정 상세 내용 조회
	ScheduleVO getViewScd(String scdno);

}
