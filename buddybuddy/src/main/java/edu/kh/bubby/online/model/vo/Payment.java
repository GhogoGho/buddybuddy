package edu.kh.bubby.online.model.vo;

import java.util.Date;

public class Payment {
	
	private int paymentNo;		
	private Date paymentDate;	// 결제일
	private int paymentAmount; // 결제 금액
	private String paymentStatus;
	private int memberNo;
	private int classNo;
	
	public Payment() {}

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

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", paymentAmount=" + paymentAmount
				+ ", paymentStatus=" + paymentStatus + ", memberNo=" + memberNo + ", classNo=" + classNo + "]";
	}
	
	
	
}
