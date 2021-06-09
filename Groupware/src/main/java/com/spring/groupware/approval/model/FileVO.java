package com.spring.groupware.approval.model;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	
	private MultipartFile attach;    
	
	private String fk_ap_seq; 				// 결재번호
	private String ap_filename;				// 결재첨부파일 이름
	private String ap_detail_filename;		// 구분용 결재첨부파일 이름
	private String ap_fileSize;    			// 파일크기 
	
	//////////////////////////////////////////////////////////////
	
	public FileVO() {}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getFk_ap_seq() {
		return fk_ap_seq;
	}

	public void setFk_ap_seq(String fk_ap_seq) {
		this.fk_ap_seq = fk_ap_seq;
	}

	public String getAp_filename() {
		return ap_filename;
	}

	public void setAp_filename(String ap_filename) {
		this.ap_filename = ap_filename;
	}

	public String getAp_detail_filename() {
		return ap_detail_filename;
	}

	public void setAp_detail_filename(String ap_detail_filename) {
		this.ap_detail_filename = ap_detail_filename;
	}

	public String getAp_fileSize() {
		return ap_fileSize;
	}

	public void setAp_fileSize(String ap_fileSize) {
		this.ap_fileSize = ap_fileSize;
	}

	//////////////////////////////////////////////////////////////
	

	
}	