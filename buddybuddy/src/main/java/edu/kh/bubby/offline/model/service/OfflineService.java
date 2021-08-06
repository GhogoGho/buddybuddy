package edu.kh.bubby.offline.model.service;

import java.util.List;

import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;

public interface OfflineService {

	/**전체 게시글 수 가져오기
	 * @param pg
	 * @return
	 */
	OffPagination getPagination(OffPagination pg);
	/**전체 게시글 수 가져오기(검색)
	 * @param search
	 * @param pg
	 * @return
	 */
	OffPagination getPagination(OffSearch search, OffPagination pg);
	/** 전체 게시글 목록 죄회
	 * @param pagination
	 * @return 
	 */
	List<OfflineClass> selectOfflinList(OffPagination pagination);
	/**검색 게시글 목록 조회
	 * @param search
	 * @param pagination
	 * @return
	 */
	List<OfflineClass> selectOfflinList(OffSearch search, OffPagination pagination);
	/**상세페이지 조회
	 * @param classNo
	 * @return
	 */
	OfflineClass selectOfflinView(int classNo);



}
