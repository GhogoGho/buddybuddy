package edu.kh.bubby.online.model.vo;

import java.util.Arrays;

public class Search {
	private String sk;
	private String sv;
	private int classType;
	private int[] ct;
	
	public Search() {}

	public String getSk() {
		return sk;
	}

	public void setSk(String sk) {
		this.sk = sk;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	public int getClassType() {
		return classType;
	}

	public void setClassType(int classType) {
		this.classType = classType;
	}

	public int[] getCt() {
		return ct;
	}

	public void setCt(int[] ct) {
		this.ct = ct;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", classType=" + classType + ", ct=" + Arrays.toString(ct) + "]";
	}
	
	
}
