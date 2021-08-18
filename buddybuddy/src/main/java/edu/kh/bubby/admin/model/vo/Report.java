package edu.kh.bubby.admin.model.vo;

import java.util.Date;

public class Report {
	
	private int reportNo;
	private String reportContent;
	private Date reportDate;
	private int memberNo;
	private int classNo;
	
	private String memberNickname;
	private String classTitle;
	private String classStatus;
	private int classTypeNo;
	
	public Report() {
	}
	

	public int getReportNo() {
		return reportNo;
	}



	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public Date getReportDate() {
		return reportDate;
	}



	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
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



	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	public String getClassTitle() {
		return classTitle;
	}



	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}



	public String getClassStatus() {
		return classStatus;
	}



	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}
	

	public int getClassTypeNo() {
		return classTypeNo;
	}


	public void setClassTypeNo(int classTypeNo) {
		this.classTypeNo = classTypeNo;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", memberNo=" + memberNo + ", classNo=" + classNo + ", memberNickname=" + memberNickname
				+ ", classTitle=" + classTitle + ", classStatus=" + classStatus + ", classTypeNo=" + classTypeNo + "]";
	}


	

}
