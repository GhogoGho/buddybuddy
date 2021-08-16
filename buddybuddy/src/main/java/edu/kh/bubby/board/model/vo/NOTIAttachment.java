package edu.kh.bubby.board.model.vo;

public class NOTIAttachment {
	private int notifileNo;
	private String notifilePath;
	private String notifileName;
	private int notifileLevel;
	private int notiNo;
	
	
	public NOTIAttachment() {	}


	public int getNotifileNo() {
		return notifileNo;
	}


	public void setNotifileNo(int notifileNo) {
		this.notifileNo = notifileNo;
	}


	public String getNotifilePath() {
		return notifilePath;
	}


	public void setNotifilePath(String notifilePath) {
		this.notifilePath = notifilePath;
	}


	public String getNotifileName() {
		return notifileName;
	}


	public void setNotifileName(String notifileName) {
		this.notifileName = notifileName;
	}


	public int getNotifileLevel() {
		return notifileLevel;
	}


	public void setNotifileLevel(int notifileLevel) {
		this.notifileLevel = notifileLevel;
	}


	public int getNotiNo() {
		return notiNo;
	}


	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}


	@Override
	public String toString() {
		return "NOTIAttachment [notifileNo=" + notifileNo + ", notifilePath=" + notifilePath + ", notifileName="
				+ notifileName + ", notifileLevel=" + notifileLevel + ", notiNo=" + notiNo + "]";
	}


	


	
}
