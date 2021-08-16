package edu.kh.bubby.board.model.vo;

import java.util.Date;
import java.util.List;

public class NOTIBoard {

	private int notiNo;
	private String notiTitle;
	private String memberNickname;
	private String notiStatus;
	private int notiReadCount;	
	private Date notiCreateDate;
	
	private String notiContent;	// 글 내용
	private int memberNo;			// 작성 회원 번호
	//private Timestamp modifyDate;	// 마지막 수정일
	private List<NOTIAttachment> atList;// 게시글에 첨부된 파일(이미지) 목록
	
	int boardType;
	
	// 삽입 시 필요한 필드 추가
	private int categoryCode;
	
	
	public NOTIBoard() {}


	
	
	public String getNotiStatus() {
		return notiStatus;
	}

	
	public void setNotiStatus(String notiStatus) {
		this.notiStatus = notiStatus;
	}


	public int getNotiNo() {
		return notiNo;
	}


	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}


	public String getNotiTitle() {
		return notiTitle;
	}


	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}


	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}


	public int getNotiReadCount() {
		return notiReadCount;
	}


	public void setNotiReadCount(int notiReadCount) {
		this.notiReadCount = notiReadCount;
	}


	public Date getNotiCreateDate() {
		return notiCreateDate;
	}


	public void setNotiCreateDate(Date notiCreateDate) {
		this.notiCreateDate = notiCreateDate;
	}


	public String getNotiContent() {
		return notiContent;
	}


	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public List<NOTIAttachment> getAtList() {
		return atList;
	}


	public void setAtList(List<NOTIAttachment> atList) {
		this.atList = atList;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public int getCategoryCode() {
		return categoryCode;
	}


	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}


	@Override
	public String toString() {
		return "NOTIBoard [notiNo=" + notiNo + ", notiTitle=" + notiTitle + ", memberNickname=" + memberNickname
				+ ", notiStatus=" + notiStatus + ", notiReadCount=" + notiReadCount + ", notiCreateDate="
				+ notiCreateDate + ", notiContent=" + notiContent + ", memberNo=" + memberNo + ", atList=" + atList
				+ ", boardType=" + boardType + ", categoryCode=" + categoryCode + "]";
	}


}
