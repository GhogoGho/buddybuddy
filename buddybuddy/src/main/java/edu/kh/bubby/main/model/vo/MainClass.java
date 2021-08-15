package edu.kh.bubby.main.model.vo;

import java.sql.Date;

public class MainClass {
	
	private int classNo;
	private String classTitle;
	private String classContent;
	private Date classCreateDt;
	private String classStatus;
	private int classReadCount;
	private int classTypeNo;
	private int classPrice;
	
	
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getClassContent() {
		return classContent;
	}
	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}
	public Date getClassCreateDt() {
		return classCreateDt;
	}
	public void setClassCreateDt(Date classCreateDt) {
		this.classCreateDt = classCreateDt;
	}
	public String getClassStatus() {
		return classStatus;
	}
	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}
	public int getClassReadCount() {
		return classReadCount;
	}
	public void setClassReadCount(int classReadCount) {
		this.classReadCount = classReadCount;
	}
	public int getclassTypeNo() {
		return classTypeNo;
	}
	public void setclassTypeNo(int classTypeNo) {
		this.classTypeNo = classTypeNo;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	
	@Override
	public String toString() {
		return "MainClass [classNo=" + classNo + ", classTitle=" + classTitle + ", classContent=" + classContent
				+ ", classCreateDt=" + classCreateDt + ", classStatus=" + classStatus + ", classReadCount="
				+ classReadCount + ", classTypeNo=" + classTypeNo + ", classPrice=" + classPrice + "]";
	}

}
