package edu.kh.bubby.member.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private String reviewStatus;
	private int reviewRatings;
	private int classNo;
	private int memberNo;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public int getReviewRatings() {
		return reviewRatings;
	}
	public void setReviewRatings(int reviewRatings) {
		this.reviewRatings = reviewRatings;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", reviewStatus=" + reviewStatus + ", reviewRatings=" + reviewRatings + ", classNo=" + classNo
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
	

}
