package edu.kh.bubby.offline.exception;

public class SaveFileException extends RuntimeException {
	public SaveFileException() {
		super("파일 저장 중 오류발생");
	}
}
