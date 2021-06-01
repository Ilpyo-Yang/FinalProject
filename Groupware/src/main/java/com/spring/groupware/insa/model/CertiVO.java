package com.spring.groupware.insa.model;

public class CertiVO {

		/////////////////////////////////////////////////////////////////////////////////////////////
		
		private int mbr_seq;
		private String certification;
		private int certiLevel;
		private String certiDate;


		/////////////////////////////////////////////////////////////////////////////////////////////
		

		public CertiVO() {}


		public String getCertification() {
			return certification;
		}


		public void setCertification(String certification) {
			this.certification = certification;
		}


		public int getCertiLevel() {
			return certiLevel;
		}


		public void setCertiLevel(int certiLevel) {
			this.certiLevel = certiLevel;
		}


		public String getCertiDate() {
			return certiDate;
		}


		public void setCertiDate(String certiDate) {
			this.certiDate = certiDate;
		}


		public int getMbr_seq() {
			return mbr_seq;
		}


		public void setMbr_seq(int mbr_seq) {
			this.mbr_seq = mbr_seq;
		}

		

		
}
