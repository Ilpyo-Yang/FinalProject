package com.spring.groupware.board.model;


public class FormboardVO {

	private String form_seq;	// 공지사항순번
	private String fk_boardno;	// 게시판번호   
	private String fk_mbr_seq;	// 작성자
	private String ftitle;		// 제목
	private String fwritedate;	// 등록일자
	private String fhit;		// 조회수
	private String fcontent;	// 내용
	
	public String getForm_seq() {
		return form_seq;
	}
	
	public void setForm_seq(String form_seq) {
		this.form_seq = form_seq;
	}
	
	public String getFk_boardno() {
		return fk_boardno;
	}
	
	public void setFk_boardno(String fk_boardno) {
		this.fk_boardno = fk_boardno;
	}
	
	public String getFk_mbr_seq() {
		return fk_mbr_seq;
	}
	
	public void setFk_mbr_seq(String fk_mbr_seq) {
		this.fk_mbr_seq = fk_mbr_seq;
	}
	
	public String getFtitle() {
		return ftitle;
	}
	
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	
	public String getFwritedate() {
		return fwritedate;
	}
	
	public void setFwritedate(String fwritedate) {
		this.fwritedate = fwritedate;
	}
	
	public String getFhit() {
		return fhit;
	}
	
	public void setFhit(String fhit) {
		this.fhit = fhit;
	}
	
	public String getFcontent() {
		return fcontent;
	}
	
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	
	
}
