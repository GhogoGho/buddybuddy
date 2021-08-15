package edu.kh.bubby.offline.model.vo;

import java.sql.Date;

public class OffClassReport {

	private int reportNo;
	private String reportContent;
	private Date reportDate;
	private int memberNo;
	private int classNo; 
	
	public OffClassReport() {
		// TODO Auto-generated constructor stub
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
	public OffClassReport(int reportNo, String reportContent, Date reportDate, int memberNo, int classNo) {
		super();
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.memberNo = memberNo;
		this.classNo = classNo;
	}
	@Override
	public String toString() {
		return "OffClassReport [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportDate="
				+ reportDate + ", memberNo=" + memberNo + ", classNo=" + classNo + "]";
	}
	
	
	
}
