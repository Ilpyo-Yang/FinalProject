package com.spring.groupware.schedule.model;

public class MtrHistoryVO {

	private String usemtrno;	// 회의실이용구분번호
	private String fk_scdno;	// 사내일정번호
	private String fk_mtrno;	// 회의실번호
	private String regDate; 	// 이용일자
	private String startdate;	// 시간
	private String endtime; 	// 종료시간
	
	///////////////////////////////////////////////////////////
	private String mtrname; // 
	///////////////////////////////////////////////////////////
	
	public MtrHistoryVO() {}

	public MtrHistoryVO(String usemtrno, String fk_scdno, String fk_mtrno, String regDate, String startdate,
			String endtime) {
		super();
		this.usemtrno = usemtrno;
		this.fk_scdno = fk_scdno;
		this.fk_mtrno = fk_mtrno;
		this.regDate = regDate;
		this.startdate = startdate;
		this.endtime = endtime;
	}

	public String getUsemtrno() {
		return usemtrno;
	}

	public void setUsemtrno(String usemtrno) {
		this.usemtrno = usemtrno;
	}

	public String getFk_scdno() {
		return fk_scdno;
	}

	public void setFk_scdno(String fk_scdno) {
		this.fk_scdno = fk_scdno;
	}

	public String getFk_mtrno() {
		return fk_mtrno;
	}

	public void setFk_mtrno(String fk_mtrno) {
		this.fk_mtrno = fk_mtrno;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getMtrname() {
		return mtrname;
	}

	public void setMtrname(String mtrname) {
		this.mtrname = mtrname;
	}
	

	
}
