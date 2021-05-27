package com.spring.groupware.schedule.service;

import com.spring.groupware.schedule.model.ScheduleVO;

public interface InterScheduleService {
	
	// 일정 등록하기
	int scdAdd(ScheduleVO schedulevo);
	
	// 등록된 일정 상세 내용 조회
	ScheduleVO getViewScd(String scdno, int login_mbrno);

}
