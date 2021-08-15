package edu.kh.bubby.offline.model.vo;

public class OffLike {
	private int classNo;
	private int memberNo;
	private int onlineLike;
	
	public OffLike() {
		// TODO Auto-generated constructor stub
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

	public int getOnlineLike() {
		return onlineLike;
	}

	public void setOnlineLike(int onlineLike) {
		this.onlineLike = onlineLike;
	}

	@Override
	public String toString() {
		return "OnLike [classNo=" + classNo + ", memberNo=" + memberNo + ", onlineLike=" + onlineLike + "]";
	}
	
	
}
