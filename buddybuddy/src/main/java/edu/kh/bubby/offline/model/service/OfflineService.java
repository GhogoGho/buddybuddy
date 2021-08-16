package edu.kh.bubby.offline.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.offline.model.vo.OffCategory;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;

/**
 * @author 82104
 *
 */
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
	
	/**상세페이지 컨텐츠내용 조회
	 * @param classNo
	 * @return
	 */
	OfflineClass selectContent(int classNo);
	/**오프라인 클래스 삽입
	 * @param offlineClass
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @param reserveAll 
	 * @return
	 */
	int insertOfflineClass(OfflineClass offlineClass, List<MultipartFile> images, String webPath, String savePath, List reserveAll);
	
	/**클래스 삭제
	 * @param classNo
	 * @return
	 */
	int deleteClass(int classNo);
	/**카테고리 조회
	 * @return
	 */
	List<OffCategory> selectCategory();
	
	/** 업데이트시 예약날짜 조회
	 * @param classNo
	 * @return
	 */
	List<OfflineClass> selectReserveUpdate(int classNo);
	/**업데이트시 기존 첨부파일 삭제
	 * @param classNo
	 * @return
	 */
	int deleteAtt(int classNo);
	/**클래스 업데이트
	 * @param offlineClass
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @param deleteReserve
	 * @param updateReserve
	 * @return
	 */
	int updateClass(OfflineClass offlineClass, List<MultipartFile> images, String webPath, String savePath,
			List deleteReserve, List updateReserve);
	OfflineClass selectPatment(OfflineClass value);



}
