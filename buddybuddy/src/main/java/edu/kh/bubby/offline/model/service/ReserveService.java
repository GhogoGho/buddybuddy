package edu.kh.bubby.offline.model.service;

import java.util.List;

import edu.kh.bubby.offline.model.vo.OfflineClass;

public interface ReserveService {

	/**예약 글 목록 조회
	 * @param offClass
	 * @return
	 */
	List<OfflineClass> reserveSelectList(OfflineClass offClass);

	/**예약자 수 조회
	 * @param reserveNo
	 * @return
	 */
	int reserveCount(int reserveNo);

}
