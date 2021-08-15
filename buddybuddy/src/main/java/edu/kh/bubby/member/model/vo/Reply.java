package edu.kh.bubby.member.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private String replyContent;
	private Date replyDate;
	private String nestedReply;
	private int classNo;
	private int memberNo;
	
	private String classTitle;
	
	
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
	
	
	
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", nestedReply=" + nestedReply + ", classNo=" + classNo + ", memberNo=" + memberNo + ", classTitle="
				+ classTitle + "]";
	}
	
	
	
	
	
	

}
