package com.spring.groupware.member.model;

public class MemberVO {
	private int mbr_seq;
	private int fk_power_no;
	private int fk_rank_no;
	private int fk_dept_no;
	private String mbr_id;
	private String mbr_pwd;
	private String mbr_name;
	private String mbr_email;
	private String mbr_com_number;
	private String mbr_phone_number;
	private String mbr_gender;
	private String mbr_birthday;
	private String mbr_registerday;
	private String mbr_retireday;
	private String mbr_pwd_changeday;
	private String mbr_status; 
	private String mbr_photo;
	private String mbr_sign;
	private String mbr_stsmsg;
	private String mbr_stsconnect;
	private String mbr_img;
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	private String power_detail; 
	private String rank_detail; 
	private String dept_detail; 
	private String pwdChangeGap;
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	private int eduLevel;


	/////////////////////////////////////////////////////////////////////////////////////////////
	

	public MemberVO() {}

	public int getMbr_seq() {
		return mbr_seq;
	}

	public void setMbr_seq(int mbr_seq) {
		this.mbr_seq = mbr_seq;
	}

	public int getFk_power_no() {
		return fk_power_no;
	}

	public void setFk_power_no(int fk_power_no) {
		this.fk_power_no = fk_power_no;
	}

	public int getFk_rank_no() {
		return fk_rank_no;
	}

	public void setFk_rank_no(int fk_rank_no) {
		this.fk_rank_no = fk_rank_no;
	}

	public int getFk_dept_no() {
		return fk_dept_no;
	}

	public void setFk_dept_no(int fk_dept_no) {
		this.fk_dept_no = fk_dept_no;
	}

	public String getMbr_id() {
		return mbr_id;
	}

	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}

	public String getMbr_pwd() {
		return mbr_pwd;
	}

	public void setMbr_pwd(String mbr_pwd) {
		this.mbr_pwd = mbr_pwd;
	}

	public String getMbr_name() {
		return mbr_name;
	}

	public void setMbr_name(String mbr_name) {
		this.mbr_name = mbr_name;
	}

	public String getMbr_email() {
		return mbr_email;
	}

	public void setMbr_email(String mbr_email) {
		this.mbr_email = mbr_email;
	}

	public String getMbr_com_number() {
		return mbr_com_number;
	}

	public void setMbr_com_number(String mbr_com_number) {
		this.mbr_com_number = mbr_com_number;
	}

	public String getMbr_phone_number() {
		return mbr_phone_number;
	}

	public void setMbr_phone_number(String mbr_phone_number) {
		this.mbr_phone_number = mbr_phone_number;
	}

	public String getMbr_gender() {
		return mbr_gender;
	}

	public void setMbr_gender(String mbr_gender) {
		this.mbr_gender = mbr_gender;
	}

	public String getMbr_birthday() {
		return mbr_birthday;
	}

	public void setMbr_birthday(String mbr_birthday) {
		this.mbr_birthday = mbr_birthday;
	}

	public String getMbr_registerday() {
		return mbr_registerday;
	}

	public void setMbr_registerday(String mbr_registerday) {
		this.mbr_registerday = mbr_registerday;
	}

	public String getMbr_retireday() {
		return mbr_retireday;
	}

	public void setMbr_retireday(String mbr_retireday) {
		this.mbr_retireday = mbr_retireday;
	}

	public String getMbr_pwd_changeday() {
		return mbr_pwd_changeday;
	}

	public void setMbr_pwd_changeday(String mbr_pwd_changeday) {
		this.mbr_pwd_changeday = mbr_pwd_changeday;
	}

	public String getMbr_status() {
		return mbr_status;
	}

	public void setMbr_status(String mbr_status) {
		this.mbr_status = mbr_status;
	}

	public String getMbr_photo() {
		return mbr_photo;
	}

	public void setMbr_photo(String mbr_photo) {
		this.mbr_photo = mbr_photo;
	}

	public String getMbr_sign() {
		return mbr_sign;
	}

	public void setMbr_sign(String mbr_sign) {
		this.mbr_sign = mbr_sign;
	}

	
	///////////////////////////////////////////////////////////////////////////////
	
	
	public String getPower_detail() {
		return power_detail;
	}

	public void setPower_detail(String power_detail) {
		this.power_detail = power_detail;
	}

	public String getRank_detail() {
		return rank_detail;
	}

	public void setRank_detail(String rank_detail) {
		this.rank_detail = rank_detail;
	}

	public String getDept_detail() {
		return dept_detail;
	}

	public void setDept_detail(String dept_detail) {
		this.dept_detail = dept_detail;
	}
	
	public String getPwdChangeGap() {
		return pwdChangeGap;
	}

	public void setPwdChangeGap(String pwdChangeGap) {
		this.pwdChangeGap = pwdChangeGap;
	}

	public int getEduLevel() {
		return eduLevel;
	}

	public void setEduLevel(int eduLevel) {
		this.eduLevel = eduLevel;
	}

	public String getMbr_stsmsg() {
		return mbr_stsmsg;
	}

	public void setMbr_stsmsg(String mbr_stsmsg) {
		this.mbr_stsmsg = mbr_stsmsg;
	}

	public String getMbr_stsconnect() {
		return mbr_stsconnect;
	}

	public void setMbr_stsconnect(String mbr_stsconnect) {
		this.mbr_stsconnect = mbr_stsconnect;
	}

	public String getMbr_img() {
		return mbr_img;
	}

	public void setMbr_img(String mbr_img) {
		this.mbr_img = mbr_img;
	}
	
	

}	

	