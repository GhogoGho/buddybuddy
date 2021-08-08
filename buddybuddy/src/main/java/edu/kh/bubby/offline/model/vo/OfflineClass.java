package edu.kh.bubby.offline.model.vo;

import java.util.Date;
import java.util.List;

import edu.kh.bubby.online.model.vo.Attachment;

public class OfflineClass {
	private int classNo;
	private String classTitle;
	private String classContent;
	private Date classCreateDate;
	private int classReadCount;
	
	private int memberNo;
	private String memberNickName;
	private List<Attachment> atList;
	private int classType; // CLASS_TYPE_NO 클래스 분류 번호 (1:온라인, 2:오프라인)
	private int categoryCode; // CATEGORY_NO 카테고리 번호 (1:요리, 2:공예, 3:미술, 4:플라워)
	private String categoryName;
	private int reviewRatings;
	private String memberProfile;//크리에이터 프로필
	
	private int reserveNo;
	private String reserveDate;
	private String reserveStart;
	private String reserveEnd;
	private int reserveLimit;
	private String classLevel;
	private String classArea;
	
	private String paymentStatus;
	private int classPrice;
	private int count;
	
	
	public OfflineClass() {
		// TODO Auto-generated constructor stub
	}




	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}




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


	public int getCategoryCode() {
		return categoryCode;
	}


	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public int getReviewRatings() {
		return reviewRatings;
	}


	public void setReviewRatings(int reviewRatings) {
		this.reviewRatings = reviewRatings;
	}


	public String getMemberProfile() {
		return memberProfile;
	}


	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}


	public int getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}


	public String getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(String reserveDate) {
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
		return classArea;
	}


	public void setClassArea(String classArea) {
		this.classArea = classArea;
	}


	public String getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public int getClassPrice() {
		return classPrice;
	}


	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}







	@Override
	public String toString() {
		return "OfflineClass [classNo=" + classNo + ", classTitle=" + classTitle + ", classContent=" + classContent
				+ ", classCreateDate=" + classCreateDate + ", classReadCount=" + classReadCount + ", memberNo="
				+ memberNo + ", memberNickName=" + memberNickName + ", atList=" + atList + ", classType=" + classType
				+ ", categoryCode=" + categoryCode + ", categoryName=" + categoryName + ", reviewRatings="
				+ reviewRatings + ", memberProfile=" + memberProfile + ", reserveNo=" + reserveNo + ", reserveDate="
				+ reserveDate + ", reserveStart=" + reserveStart + ", reserveEnd=" + reserveEnd + ", reserveLimit="
				+ reserveLimit + ", classLevel=" + classLevel + ", classArea=" + classArea + ", paymentStatus="
				+ paymentStatus + ", classPrice=" + classPrice + "]";
	}









	
}
