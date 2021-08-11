package edu.kh.bubby.offline.model.vo;

import java.util.Date;

public class OffReply {
	private int replyNo;
	private String replyContent;
	private Date replyDate;
	private String nestedReply;
	private int classNo;
	private int memberNo;
	private String memberNickName;
	private String memberProfile;
	
	public OffReply() {}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getNestedReply() {
		return nestedReply;
	}

	public void setNestedReply(String nestedReply) {
		this.nestedReply = nestedReply;
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

	@Override
	public String toString() {
		return "OnReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", nestedReply=" + nestedReply + ", classNo=" + classNo + ", memberNo=" + memberNo
				+ ", memberNickName=" + memberNickName + ", memberProfile=" + memberProfile + "]";
	}

	
	
}
