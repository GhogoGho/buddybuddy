package edu.kh.bubby.member.model.vo;

import java.sql.Date;

public class Choice {
	
	private int classNo;
	private int memberNo;
	
	private String categoryNm;
	private int categoryNo;
	private String classTitle;
	private int classTypeNo;
	private Date classCreateDate;
	
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
		return "Choice [classNo=" + classNo + ", memberNo=" + memberNo + ", categoryNm=" + categoryNm + ", categoryNo="
				+ categoryNo + ", classTitle=" + classTitle + ", classTypeNo=" + classTypeNo + ", classCreateDate="
				+ classCreateDate + "]";
	}
	
	

}
