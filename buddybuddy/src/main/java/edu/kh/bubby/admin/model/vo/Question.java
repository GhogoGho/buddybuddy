package edu.kh.bubby.admin.model.vo;

import java.util.Date;

public class Question {

	private int queNo;
	private String queTitle;
	private String queContent;
	private Date queCreateDate;
	private String queStatus;
	private Date answerDate;
	private String answerContent;
	private int memberNo;
	private String memberNickname;
	
	public Question() {
	}

	public int getQueNo() {
		return queNo;
	}

	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}

	public String getQueTitle() {
		return queTitle;
	}

	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}

	public String getQueContent() {
		return queContent;
	}

	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}

	public Date getQueCreateDate() {
		return queCreateDate;
	}

	public void setQueCreateDate(Date queCreateDate) {
		this.queCreateDate = queCreateDate;
	}

	public String getQueStatus() {
		return queStatus;
	}

	public void setQueStatus(String queStatus) {
		this.queStatus = queStatus;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "Question [queNo=" + queNo + ", queTitle=" + queTitle + ", queContent=" + queContent + ", queCreateDate="
				+ queCreateDate + ", queStatus=" + queStatus + ", answerDate=" + answerDate + ", answerContent="
				+ answerContent + ", memberNo=" + memberNo + ", memberNickname=" + memberNickname + "]";
	}


	
}
