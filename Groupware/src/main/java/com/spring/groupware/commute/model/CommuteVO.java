package com.spring.groupware.commute.model;

public class CommuteVO {

	String fk_mbr_seq;		// 사원번호
	String starttime;		// 출근시간
	String startstatus;		// 출근상태
	String endtime;			// 퇴근시간
	String endstatus;		// 퇴근상태
		
	
	public String getFk_mbr_seq() {
		return fk_mbr_seq;
	}
	
	public void setFk_mbr_seq(String fk_mbr_seq) {
		this.fk_mbr_seq = fk_mbr_seq;
	}
	
	public String getStarttime() {
		return starttime;
	}
	
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	
	public String getStartstatus() {
		return startstatus;
	}
	
	public void setStartstatus(String startstatus) {
		this.startstatus = startstatus;
	}
	
	public String getEndtime() {
		return endtime;
	}
	
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	public String getEndstatus() {
		return endstatus;
	}
	
	public void setEndstatus(String endstatus) {
		this.endstatus = endstatus;
	}
	
	
}
