package com.spring.groupware.schedule.model;

import java.util.List;
import java.util.Map;

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
	
	// 일정 수정하기
	@Override
	public int editScd(ScheduleVO schedulevo) {
		int n = sqlsession.update("schedule.editScd", schedulevo);
		return n;
	}
	
	//일정 삭제하기
	@Override
	public int delScd(ScheduleVO schedulevo) {
		int n = sqlsession.delete("schedule.delScd", schedulevo);
		return n;
	}
	
	// 캘린더에 일정 보여주기
	@Override
	public List<Map<String, String>> showScd(String userid) {
		List<Map<String, String>> scdList = sqlsession.selectList("schedule.showScd", userid);
		return scdList;
	}
	
	///////////////////////////////////////////////////////////////////
	
	// 회의실 예약하기
	@Override
	public int resvMtrEnd(MtrHistoryVO mtrhvo) {
		int n = sqlsession.insert("schedule.resvMtrEnd", mtrhvo);
		return n;
	}

	
	// 예약된 회의실 상세 내용 조회
	@Override
	public MtrHistoryVO getViewMtr(String usemtrno) {
		MtrHistoryVO mtrhvo = sqlsession.selectOne("schedule.getViewMtr", usemtrno);
		return mtrhvo;
	}
	
	// 회의실 예약취소(삭제)
	@Override
	public int delMtrReg(String usemtrno) {
		int n = sqlsession.delete("schedule.delMtrReg", usemtrno);
		return n;
	}
	
	// 회의실 예약현황 보여주기(구글 차트)
	@Override
	public List<Map<String, String>> goRegMtr() {
		List<Map<String, String>> regDetailList = sqlsession.selectList("schedule.goRegMtr");
		return regDetailList;
	}
	
	

	
	

	

	
	
	
}
