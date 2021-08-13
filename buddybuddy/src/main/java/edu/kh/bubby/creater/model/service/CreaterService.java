package edu.kh.bubby.creater.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Notice;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;

public interface CreaterService {


	/** 전체 클래스 수 + 클래스 이름 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 내 클래스 목록 조회
	 * @param classNo
	 * @return
	 */
	List<Online> getClassList(Pagination pagination);

	/** 내 공지사항 목록 조회
	 * @param memberNo
	 * @return
	 */
	List<Notice> selectMyNotice(int memberNo);

	

}
