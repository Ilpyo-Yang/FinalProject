package com.spring.groupware.schedule.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class ScheduleDAO implements InterScheduleDAO {

	private SqlSessionTemplate sqlsession;
	
	// 일정 등록하기
	@Override
	public int scdAdd(ScheduleVO schedulevo) {
		int n = sqlsession.insert("schedule.scdAdd", schedulevo);
		return n;
	}
	
	// 등록된 일정 상세 내용 조회
	@Override
	public ScheduleVO getViewScd(String scdno) {
		ScheduleVO schedulevo = sqlsession.selectOne("schedule.getViewScd", scdno);
		return schedulevo;
	}
	
	// 회의실 예약하기
	@Override
	public int regMtrEnd(MtrHistoryVO mtrhvo) {
		int n = sqlsession.insert("schedule.regMtrEnd", mtrhvo);
		return n;
	}
	
	
	
}
