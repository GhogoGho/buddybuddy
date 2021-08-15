package edu.kh.bubby.offline.model.service;

import java.util.List;

import edu.kh.bubby.offline.model.vo.OffClassReport;
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

	/**예약하기
	 * @param offClass
	 * @param insertNum
	 * @return
	 */
	int reserveInsert(OfflineClass offClass, int insertNum);

	/**클래스 신고
	 * @param classReport
	 * @return
	 */
	int reportClass(OffClassReport classReport);

}
