package com.spring.groupware.workmanage.model;

public class WorkMemberVO {
	private String fk_wmno;		// 업무 고유번호
	private String fk_wrno;		// 해당 업무에 대한 역할(발신자, 수신자, 참조자)
	private String fk_mbr_seq;	// 멤버 seq 
	
	public WorkMemberVO() {}
	
	public WorkMemberVO(String fk_wmno, String fk_wrno, String fk_mbr_seq) {
		super();
		this.fk_wmno = fk_wmno;
		this.fk_wrno = fk_wrno;
		this.fk_mbr_seq = fk_mbr_seq;
	}

	public String getFk_wmno() {
		return fk_wmno;
	}

	public void setFk_wmno(String fk_wmno) {
		this.fk_wmno = fk_wmno;
	}

	public String getFk_wrno() {
		return fk_wrno;
	}

	public void setFk_wrno(String fk_wrno) {
		this.fk_wrno = fk_wrno;
	}

	public String getFk_mbr_seq() {
		return fk_mbr_seq;
	}

	public void setFk_mbr_seq(String fk_mbr_seq) {
		this.fk_mbr_seq = fk_mbr_seq;
	}
	
	
}
