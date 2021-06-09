package com.spring.groupware.workmanage.model;

import org.springframework.web.multipart.MultipartFile;

public class WorkVO {
	private String wmno; 				//업무관리고유번호
	private String fk_wtno; 			// 업무분류번호
	private String requester; 			// 요청자
	private String receivers;			// 수신자들
	private String referrers;			// 참조자들
	private String subject;				// 제목
	private String contents;			// 내용
	private String registerday;			// 등록일자
	private String deadline; 			// 마감일자
	private String checkstatus;			// 확인여부 (0 or 1)
	private String important;			// 중요여부 (0 or 1)
	private String fk_statno;  			// 업무상태번호
	
	private String delayday;  			// 마감일자 지난 일 수 
	private String lasteditdate; 	// 마지막으로 수정한 날짜
	
	private MultipartFile attach;
	// form 태그에서 type="file" 인 파일을 받아서 저장되는 필드. 진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
	// jsp 파일에서 input type="file" 인 name 의 이름(attach)과 동일해야한다. 
	
	private String fileName; // WAS(톰캣)에 저장될 파일명(2020120809271535243254235235234.png)
	private String orgFilename; // 진짜 파일명(강아지.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String fileSize; // 파일크기

	
	public WorkVO() {}
	
	public WorkVO(String wmno, String fk_wtno, String requester, String receivers, String referrers, String subject,
			String contents, String registerday, String deadline, String checkstatus, String important,
			String fk_statno, String fileName, String orgFilename, String fileSize) {
	
		this.wmno = wmno;
		this.fk_wtno = fk_wtno;
		this.requester = requester;
		this.receivers = receivers;
		this.referrers = referrers;
		this.subject = subject;
		this.contents = contents;
		this.registerday = registerday;
		this.deadline = deadline;
		this.checkstatus = checkstatus;
		this.important = important;
		this.fk_statno = fk_statno;
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
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

	
	public String getRequester() {
		return requester;
	}

	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getReceivers() {
		return receivers;
	}

	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}

	public String getReferrers() {
		return referrers;
	}

	public void setReferrers(String referrers) {
		this.referrers = referrers;
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

	// --------------------------------------
	
	public String getDelayday() {
		return delayday;
	}

	public void setDelayday(String delayday) {
		this.delayday = delayday;
	}
	
	public String getLasteditdate() {
		return lasteditdate;
	}

	public void setLasteditdate(String lasteditdate) {
		this.lasteditdate = lasteditdate;
	}
	
	// 첨부 파일 관련 ------------------------------

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOrgFilename() {
		return orgFilename;
	}

	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
}
