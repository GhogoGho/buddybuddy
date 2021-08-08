package edu.kh.bubby.online.model.vo;

import java.util.Date;
import java.util.List;

public class Online {
	private int classNo;
	private String classTitle;
	private String classContent;
	private Date classCreateDate;
	private int classReadCount;
	
	private int memberNo;
	private String memberNickName;
	private List<Attachment> atList;
	private int classType; // CLASS_TYPE_NO 클래스 분류 번호 (1:온라인, 2:오프라인)
	private int categoryNo; // CATEGORY_NO 카테고리 번호 (1:요리, 2:공예, 3:미술, 4:플라워)
	private String categoryName;
	
	public Online() {}

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

	public Date getClassCreateDate() {
		return classCreateDate;
	}

	public void setClassCreateDate(Date classCreateDate) {
		this.classCreateDate = classCreateDate;
	}

	public int getClassReadCount() {
		return classReadCount;
	}

	public void setClassReadCount(int classReadCount) {
		this.classReadCount = classReadCount;
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

	public List<Attachment> getAtList() {
		return atList;
	}

	public void setAtList(List<Attachment> atList) {
		this.atList = atList;
	}

	public int getClassType() {
		return classType;
	}

	public void setClassType(int classType) {
		this.classType = classType;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Online [classNo=" + classNo + ", classTitle=" + classTitle + ", classContent=" + classContent
				+ ", classCreateDate=" + classCreateDate + ", classReadCount=" + classReadCount + ", memberNo="
				+ memberNo + ", memberNickName=" + memberNickName + ", atList=" + atList + ", classType=" + classType
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}


	
	
}
