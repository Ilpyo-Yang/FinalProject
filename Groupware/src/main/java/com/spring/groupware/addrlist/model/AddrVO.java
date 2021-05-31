package com.spring.groupware.addrlist.model;


public class AddrVO {

	private int addr_seq;
	private int fk_group_seq;
	private int fk_mbr_seq;
	private String mbr_name;
	private String mbr_phone_number;
	private String mbr_email;
	private String mbr_birthday;
	private String dept_name;
	private String position_name;
	private String postcode;
	private String address;
	private String detailaddress;
	private String addrmemo;
	
	
	public int getAddr_seq() {
		return addr_seq;
	}
	
	public void setAddr_seq(int addr_seq) {
		this.addr_seq = addr_seq;
	}
	
	public int getFk_group_seq() {
		return fk_group_seq;
	}
	
	public void setFk_group_seq(int fk_group_seq) {
		this.fk_group_seq = fk_group_seq;
	}
	
	public int getFk_mbr_seq() {
		return fk_mbr_seq;
	}
	
	public void setFk_mbr_seq(int fk_mbr_seq) {
		this.fk_mbr_seq = fk_mbr_seq;
	}
	
	public String getMbr_name() {
		return mbr_name;
	}
	
	public void setMbr_name(String mbr_name) {
		this.mbr_name = mbr_name;
	}
	
	public String getMbr_phone_number() {
		return mbr_phone_number;
	}
	
	public void setMbr_phone_number(String mbr_phone_number) {
		this.mbr_phone_number = mbr_phone_number;
	}
	
	public String getMbr_email() {
		return mbr_email;
	}
	
	public void setMbr_email(String mbr_email) {
		this.mbr_email = mbr_email;
	}
	
	public String getMbr_birthday() {
		return mbr_birthday;
	}
	
	public void setMbr_birthday(String mbr_birthday) {
		this.mbr_birthday = mbr_birthday;
	}
	
	public String getDept_name() {
		return dept_name;
	}
	
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	public String getPosition_name() {
		return position_name;
	}
	
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	
	public String getPostcode() {
		return postcode;
	}
	
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDetailaddress() {
		return detailaddress;
	}
	
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	
	public String getAddrmemo() {
		return addrmemo;
	}
	
	public void setAddrmemo(String addrmemo) {
		this.addrmemo = addrmemo;
	}
	
	

}
