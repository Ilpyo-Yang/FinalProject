package com.spring.groupware.schedule.service;

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
	public ScheduleVO getViewScd(String scdno, int login_mbrno) {
		
		ScheduleVO schedulevo = dao.getViewScd(scdno);	// 일정 한개 조회하기
		if(schedulevo != null && login_mbrno == Integer.parseInt(schedulevo.getFk_mbr_seq())){
			schedulevo = dao.getViewScd(scdno);
		}
		else {
			schedulevo = null;
		}
		
		return schedulevo;
	}
	
	// 회의실 예약하기
	@Override
	public int regMtrEnd(MtrHistoryVO mtrhvo) {
		int n = dao.regMtrEnd(mtrhvo);
		return n;
	}
	
}
