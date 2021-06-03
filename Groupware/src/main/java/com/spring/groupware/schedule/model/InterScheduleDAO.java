package com.spring.groupware.schedule.model;

import java.util.List;
import java.util.Map;

public interface InterScheduleDAO {
	
	// 일정 등록하기
	int scdAdd(ScheduleVO schedulevo);
	
	// 일정번호 채번해오기
	int getScdno();
	
	// 수정해야할 글 1개 가져오기
	ScheduleVO getViewScd(String scdno);
	
	// 일정 수정하기
	int editScd(ScheduleVO schedulevo);
	
	// 일정 삭제하기
	int delScd(String scdno);
	
	// 캘린더에 일정 보여주기
	List<Map<String, String>> showScd(String userid);
	
	//////////////////////////////////////////////////////
	
	// 회의실 이용기록번호 채번하기
	int getNum();
	
	// 회의실 예약하기
	int resvMtrEnd(MtrHistoryVO mtrhvo);
	
	// 예약된 회의실 상세 내용 조회
	MtrHistoryVO getViewMtr(String usemtrno);
	
	// 회의실 예약취소(삭제)
	int delMtrReg(String usemtrno);
	
	// 회의실 예약현황 보여주기(구글 차트)
	/* List<Map<String, String>> goRegMtr(); */
	
	
	
	


	
	
	
	

	
	
	
	
	

}
