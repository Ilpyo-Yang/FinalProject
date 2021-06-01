package com.spring.groupware.schedule.service;

import java.util.List;
import java.util.Map;

import com.spring.groupware.schedule.model.MtrHistoryVO;
import com.spring.groupware.schedule.model.ScheduleVO;

public interface InterScheduleService {
	
	// 일정 등록하기
	int scdAdd(ScheduleVO schedulevo);
	
	// 등록된 일정 상세 내용 조회
	ScheduleVO getViewScd(String scdno);
	
	// 일정 수정하기
	int editScd(ScheduleVO schedulevo);
	
	// 일정 삭제하기
	int delScd(ScheduleVO schedulevo);
	
	// 일정 풀캘린더에 보여주기
	List<Map<String, String>> showScd(String userid);
	
	//////////////////////////////////////////////////////
	
	// 회의실 예약하기
	int resvMtrEnd(MtrHistoryVO mtrhvo);
	
	// 예약된 회의실 상세 내용 조회
	MtrHistoryVO getViewMtr(String usemtrno);
	
	// 회의실 예약취소(삭제)
	int delMtrReg(String usemtrno);
	
	// 회의실 예약현황 보여주기(구글 차트)
	List<Map<String, String>> goRegMtr();
	
	
	
	

	
	
	
	
	


	
	

}
