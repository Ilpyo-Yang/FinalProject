package com.spring.groupware.board.model;

public class FormfileVO {

	private String fk_form_seq;	// 서식번호
	private String ffile_seq;	// 첨부파일번호
	private String ffilename;	// 첨부파일명
	private String ffilepath;	// 첨부파일경로
	private String ffilesize;	// 첨부파일크기
	private String fuploaddate;	// 업로드일자
	
	public String getFk_form_seq() {
		return fk_form_seq;
	}
	public void setFk_form_seq(String fk_form_seq) {
		this.fk_form_seq = fk_form_seq;
	}
	public String getFfile_seq() {
		return ffile_seq;
	}
	public void setFfile_seq(String ffile_seq) {
		this.ffile_seq = ffile_seq;
	}
	public String getFfilename() {
		return ffilename;
	}
	public void setFfilename(String ffilename) {
		this.ffilename = ffilename;
	}
	public String getFfilepath() {
		return ffilepath;
	}
	public void setFfilepath(String ffilepath) {
		this.ffilepath = ffilepath;
	}
	public String getFfilesize() {
		return ffilesize;
	}
	public void setFfilesize(String ffilesize) {
		this.ffilesize = ffilesize;
	}
	public String getFuploaddate() {
		return fuploaddate;
	}
	public void setFuploaddate(String fuploaddate) {
		this.fuploaddate = fuploaddate;
	}
	
	
}
