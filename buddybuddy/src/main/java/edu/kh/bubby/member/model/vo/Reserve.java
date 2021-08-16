package edu.kh.bubby.member.model.vo;

import java.sql.Date;

public class Reserve {
	
	private int reserveNo;
	private Date reserveDate;
	private String reserveStart;
	private String reserveEnd;
	private int reserveLimit;
	private String classLevel;
	private String ClassArea;
	private int memberNo;
	private int classNo;
	private String reserveStatus;
	
	private String categoryNm;
	private int categoryNo;
	
	private String classTitle;
	private int classType;
	
	private Date classCreateDate;

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getReserveStart() {
		return reserveStart;
	}

	public void setReserveStart(String reserveStart) {
		this.reserveStart = reserveStart;
	}

	public String getReserveEnd() {
		return reserveEnd;
	}

	public void setReserveEnd(String reserveEnd) {
		this.reserveEnd = reserveEnd;
	}

	public int getReserveLimit() {
		return reserveLimit;
	}

	public void setReserveLimit(int reserveLimit) {
		this.reserveLimit = reserveLimit;
	}

	public String getClassLevel() {
		return classLevel;
	}

	public void setClassLevel(String classLevel) {
		this.classLevel = classLevel;
	}

	public String getClassArea() {
		return ClassArea;
	}

	public void setClassArea(String classArea) {
		ClassArea = classArea;
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

	public String getReserveStatus() {
		return reserveStatus;
	}

	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
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

	public int getclassType() {
		return classType;
	}

	public void setclassType(int classType) {
		this.classType = classType;
	}

	public Date getClassCreateDate() {
		return classCreateDate;
	}

	public void setClassCreateDate(Date classCreateDate) {
		this.classCreateDate = classCreateDate;
	}

	@Override
	public String toString() {
		return "Reserve [reserveNo=" + reserveNo + ", reserveDate=" + reserveDate + ", reserveStart=" + reserveStart
				+ ", reserveEnd=" + reserveEnd + ", reserveLimit=" + reserveLimit + ", classLevel=" + classLevel
				+ ", ClassArea=" + ClassArea + ", memberNo=" + memberNo + ", classNo=" + classNo + ", reserveStatus="
				+ reserveStatus + ", categoryNm=" + categoryNm + ", categoryNo=" + categoryNo + ", classTitle="
				+ classTitle + ", classType=" + classType + ", classCreateDate=" + classCreateDate + "]";
	}
	
	
	
	
	
	
	

}
