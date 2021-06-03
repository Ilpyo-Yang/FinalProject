package com.spring.groupware.schedule.model;

public class MeetingRoomVO {
	
	private String mtrno;
	private String mtrname;
	private String avlstarttime;
	private String avlendtime;
	
	public MeetingRoomVO() {}
	
	public MeetingRoomVO(String mtrno, String mtrname, String avlstarttime, String avlendtime) {
		super();
		this.mtrno = mtrno;
		this.mtrname = mtrname;
		this.avlstarttime = avlstarttime;
		this.avlendtime = avlendtime;
	}

	public String getMtrno() {
		return mtrno;
	}

	public void setMtrno(String mtrno) {
		this.mtrno = mtrno;
	}

	public String getMtrname() {
		return mtrname;
	}

	public void setMtrname(String mtrname) {
		this.mtrname = mtrname;
	}

	public String getAvlstarttime() {
		return avlstarttime;
	}

	public void setAvlstarttime(String avlstarttime) {
		this.avlstarttime = avlstarttime;
	}

	public String getAvlendtime() {
		return avlendtime;
	}

	public void setAvlendtime(String avlendtime) {
		this.avlendtime = avlendtime;
	}
	
	
	
	
}
