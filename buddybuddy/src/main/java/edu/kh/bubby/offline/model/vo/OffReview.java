package edu.kh.bubby.offline.model.vo;

import java.util.Date;
import java.util.List;

public class OffReview {
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private String reviewRatings;
	private int classNo;
	private int memberNo;
	private String memberNickName;
	private String memberProfile;
	
	private List<OffReviewAttachment> atList;
	
	public OffReview() {
		// TODO Auto-generated constructor stub
	}

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

	public String getReviewRatings() {
		return reviewRatings;
	}

	public void setReviewRatings(String reviewRatings) {
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

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	public List<OffReviewAttachment> getAtList() {
		return atList;
	}

	public void setAtList(List<OffReviewAttachment> atList) {
		this.atList = atList;
	}

	@Override
	public String toString() {
		return "OnReview [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", reviewRatings=" + reviewRatings + ", classNo=" + classNo + ", memberNo=" + memberNo
				+ ", memberNickName=" + memberNickName + ", memberProfile=" + memberProfile + ", atList=" + atList
				+ "]";
	}

	
	
}
