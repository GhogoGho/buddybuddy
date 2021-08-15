package edu.kh.bubby.member.model.vo;

import java.sql.Date;

public class Payment {
	
	private int paymentNo;
	private Date paymentDate;
	private int paymentAmount;
	private String paymentStatus;
	private int memberNo;
	private int classNo;
	
	private String categoryNm;
	private int categoryNo;
	
	private String classTitle;
	private int classTypeNo;
	
	private Date classCreateDate;

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getClassTitle() {
		return classTitle;
	}

	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}

	public int getClassTypeNo() {
		return classTypeNo;
	}

	public void setClassTypeNo(int classTypeNo) {
		this.classTypeNo = classTypeNo;
	}

	public Date getClassCreateDate() {
		return classCreateDate;
	}

	public void setClassCreateDate(Date classCreateDate) {
		this.classCreateDate = classCreateDate;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", paymentAmount=" + paymentAmount
				+ ", paymentStatus=" + paymentStatus + ", memberNo=" + memberNo + ", classNo=" + classNo
				+ ", categoryNm=" + categoryNm + ", categoryNo=" + categoryNo + ", classTitle=" + classTitle
				+ ", classTypeNo=" + classTypeNo + ", classCreateDate=" + classCreateDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
