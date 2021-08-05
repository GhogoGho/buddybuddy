package edu.kh.bubby.offline.model.service;

import edu.kh.bubby.online.model.vo.Pagination;

public interface OfflineService {

	/**전체 게시글 수 가져오기
	 * @param pg
	 * @return
	 */
	Pagination getPagination(Pagination pg);

}
