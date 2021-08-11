package edu.kh.bubby.offline.model.vo;

public class OffReviewAttachment {
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int reviewNo;
	
	
	public OffReviewAttachment() {	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	@Override
	public String toString() {
		return "ReviewAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", fileLevel=" + fileLevel + ", reviewNo=" + reviewNo + "]";
	}


	
}
