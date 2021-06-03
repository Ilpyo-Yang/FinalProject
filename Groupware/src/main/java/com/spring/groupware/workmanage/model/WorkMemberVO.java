package com.spring.groupware.workmanage.model;


public class WorkMemberVO {
	private String fk_wmno;		// 업무 고유번호
	private String fk_wrno;		// 해당 업무에 대한 역할(발신자, 수신자, 참조자)
	private String fk_mbr_seq;	// 멤버 seq 
	
	private String mbr_workPercent;	// 개인 업무 진행 상태
	private String mbr_readCheck;	// 개인 읽음 확인
	private String lasteditdate; 	// 마지막으로 수정한 날짜
	private String readcheckdate; 	// 읽은 날짜
	
//	private MemberVO mbr;
	private String mbr_name;	// 멤버 이름 저장하기 위해 생성
	
	public WorkMemberVO() {}
	
	
	public WorkMemberVO(String fk_wmno, String fk_wrno, String fk_mbr_seq, String mbr_workPercent, String mbr_readCheck,
			String lasteditdate, String readcheckdate) {
		super();
		this.fk_wmno = fk_wmno;
		this.fk_wrno = fk_wrno;
		this.fk_mbr_seq = fk_mbr_seq;
		this.mbr_workPercent = mbr_workPercent;
		this.mbr_readCheck = mbr_readCheck;
		this.lasteditdate = lasteditdate;
		this.readcheckdate = readcheckdate;
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

	public String getMbr_workPercent() {
		return mbr_workPercent;
	}

	public void setMbr_workPercent(String mbr_workPercent) {
		this.mbr_workPercent = mbr_workPercent;
	}

	public String getMbr_readCheck() {
		return mbr_readCheck;
	}

	public void setMbr_readCheck(String mbr_readCheck) {
		this.mbr_readCheck = mbr_readCheck;
	}

	public String getLasteditdate() {
		return lasteditdate;
	}

	public void setLasteditdate(String lasteditdate) {
		this.lasteditdate = lasteditdate;
	}

	public String getReadcheckdate() {
		return readcheckdate;
	}

	public void setReadcheckdate(String readcheckdate) {
		this.readcheckdate = readcheckdate;
	}
	
	// -------------------------------------------
	

	public String getMbr_name() {
		return mbr_name;
	}


	public void setMbr_name(String mbr_name) {
		this.mbr_name = mbr_name;
	}

	
}
