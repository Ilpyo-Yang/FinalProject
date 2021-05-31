package com.spring.groupware.schedule.model;

public interface InterScheduleDAO {
	
	// 일정 등록하기
	int scdAdd(ScheduleVO schedulevo);
	
	// 등록된 일정 상세 내용 조회
	ScheduleVO getViewScd(String scdno);
	
	// 일정 수정하기
	int editScd(ScheduleVO schedulevo);
	
	// 일정 삭제하기
	int delScd(ScheduleVO schedulevo);
		
	// 회의실 예약하기
	int regMtrEnd(MtrHistoryVO mtrhvo);
	
	// 예약된 회의실 상세 내용 조회
	MtrHistoryVO getViewMtr(String usemtrno);
	
	// 회의실 예약취소(삭제)
	int delMtrReg(String usemtrno);

	
	
	
	
	

}
