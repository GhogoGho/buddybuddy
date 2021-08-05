package edu.kh.bubby.offline.model.service;

import java.util.List;

import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OfflineClass;

public interface OfflineService {

	/**전체 게시글 수 가져오기
	 * @param pg
	 * @return
	 */
	OffPagination getPagination(OffPagination pg);

	/** 전체 게시글 목록 죄회
	 * @param pagination
	 * @return 
	 */
	List<OfflineClass> selectOfflinList(OffPagination pagination);

}
