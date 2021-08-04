package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

public interface OnlineService {

	/** 전체 게시글 수 + 클래스 이름 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 전체 게시글 수 + 클래스 이름 조회(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);

	/** 클래스 목록 조회
	 * @param pagination
	 * @return onlineList
	 */
	List<Online> selectOnlineList(Pagination pagination);

	/** 클래스 목록 조회(검색)
	 * @param search
	 * @param pagination
	 * @return onlineList
	 */
	List<Online> selectOnlineList(Search search, Pagination pagination);


}
