package com.spring.groupware.workmanage.model;

public class WorkManageVO {
	private String wmno; 				//업무관리고유번호
	private String fk_wtno; 			// 업무분류번호
	private String fk_requester_seq; 	// 요청자 사원번호
	private String fk_receiver_seq;		// 수신자(담당자) 사원번호
	private String subject;				// 제목
	private String contents;			// 내용
	private String registerday;			// 등록일자
	private String deadline; 			// 마감일자
	private String checkstatus;			// 확인여부 (0 or 1)
	private String important;			// 중요여부 (0 or 1)
	private String fk_statno;  			// 업무상태번호
	
	public WorkManageVO() {}
	
	public WorkManageVO(String wmno, String fk_wtno, String fk_requester_seq, String fk_receiver_seq, String subject,
			String contents, String registerday, String deadline, String checkstatus, String important,
			String fk_statno) {
	
		this.wmno = wmno;
		this.fk_wtno = fk_wtno;
		this.fk_requester_seq = fk_requester_seq;
		this.fk_receiver_seq = fk_receiver_seq;
		this.subject = subject;
		this.contents = contents;
		this.registerday = registerday;
		this.deadline = deadline;
		this.checkstatus = checkstatus;
		this.important = important;
		this.fk_statno = fk_statno;
	}

	public String getWmno() {
		return wmno;
	}

	public void setWmno(String wmno) {
		this.wmno = wmno;
	}

	public String getFk_wtno() {
		return fk_wtno;
	}

	public void setFk_wtno(String fk_wtno) {
		this.fk_wtno = fk_wtno;
	}

	public String getFk_requester_seq() {
		return fk_requester_seq;
	}

	public void setFk_requester_seq(String fk_requester_seq) {
		this.fk_requester_seq = fk_requester_seq;
	}

	public String getFk_receiver_seq() {
		return fk_receiver_seq;
	}

	public void setFk_receiver_seq(String fk_receiver_seq) {
		this.fk_receiver_seq = fk_receiver_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getCheckstatus() {
		return checkstatus;
	}

	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getFk_statno() {
		return fk_statno;
	}

	public void setFk_statno(String fk_statno) {
		this.fk_statno = fk_statno;
	}
	
	
}
