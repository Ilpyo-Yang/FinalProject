package com.spring.groupware.schedule.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.groupware.schedule.model.InterScheduleDAO;
import com.spring.groupware.schedule.model.MtrHistoryVO;
import com.spring.groupware.schedule.model.ScheduleVO;

@Component
@Service
public class ScheduleService implements InterScheduleService{
	
	// === 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private InterScheduleDAO dao;
	
	// 일정 등록하기
	@Override
	public int scdAdd(ScheduleVO schedulevo) {
		int n = dao.scdAdd(schedulevo);
		return n;
	}
	
	// 등록된 일정 상세 내용 조회
	@Override
	public ScheduleVO getViewScd(String scdno) {
		
		ScheduleVO schedulevo = dao.getViewScd(scdno);	// 일정 한개 조회하기
		
		return schedulevo;
	}
	
	// 일정 수정하기
	@Override
	public int editScd(ScheduleVO schedulevo) {
		int n = dao.editScd(schedulevo);
		return n;
	}
	
	// 일정 삭제하기
	@Override
	public int delScd(ScheduleVO schedulevo) {
		int n = dao.delScd(schedulevo);
		return n;
	}
	
	// 캘린더에 일정 보여주기
	@Override
	public List<Map<String, String>> showScd(String userid) {
		List<Map<String, String>> scdList = dao.showScd(userid);
		return scdList;
	}
	
	///////////////////////////////////////////////////////////일정끝
	
	// 회의실 예약하기
	@Override
	public int resvMtrEnd(MtrHistoryVO mtrhvo) {
		int n = dao.resvMtrEnd(mtrhvo);
		return n;
	}
	
	// 예약된 회의실 상세 내용 조회
	@Override
	public MtrHistoryVO getViewMtr(String usemtrno) {
		MtrHistoryVO mtrhvo = dao.getViewMtr(usemtrno);
		return mtrhvo;
	}
	
	// 회의실 예약취소(삭제)
	@Override
	public int delMtrReg(String usemtrno) {
		int n = dao.delMtrReg(usemtrno);
		return n;
	}
	
	// 회의실 예약현황 보여주기(구글 차트)
	@Override
	public List<Map<String, String>> goRegMtr() {
		List<Map<String, String>> regDetailList = dao.goRegMtr();
		return regDetailList;
	}

	

	
	
	

	

	
	
}
