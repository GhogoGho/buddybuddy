package edu.kh.bubby.offline.exception;

public class updateReserveDeleteException extends RuntimeException {
	public updateReserveDeleteException() {
		super("예약 날짜 삭제 중 오류발생");
	}
}
