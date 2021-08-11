package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.online.model.vo.Category;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Pagination;
import edu.kh.bubby.online.model.vo.Search;

public interface OnlineService {

	/** 전체 클래스 수 + 클래스 이름 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 전체 클래스 수 + 클래스 이름 조회(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getIndiPagination(Search search, Pagination pg);
	
	/** 전체 클래스 수 + 클래스 이름 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getIndiPagination(Pagination pg);
	
	/** 전체 클래스 수 + 클래스 이름 조회(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);
	
	/** Individual 목록 조회
	 * @param pagination
	 * @return individualList
	 */
	List<Online> selectIndividualList(Pagination pagination);

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

	/** 클래스 상세 조회
	 * @param classNo
	 * @return online
	 */
	Online selectOnline(int classNo);

	/** 카테고리 조회
	 * @return
	 */
	List<Category> selectCategory();

	/** 클래스 수정 상세 조회
	 * @param classNo
	 * @return online
	 */
	Online selectUpdateOnline(int classNo);

	//=========================================================
	
	/** 클래스 삽입
	 * @param online
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @return classNo
	 */
	int insertOnlineClass(Online online, List<MultipartFile> images, String webPath, String savePath);
	
	
	/** 클래스 수정
	 * @param online
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @param deleteImages
	 * @return result
	 */
	int updateOnline(Online online, List<MultipartFile> videos, String webPath, String savePath, String deleteVideos);
	
	
	
	
	
	//=========================================================
	/** 클래스 삽입 (썸머 테스트)
	 * @param online
	 * @return result
	 */
	int insertOnline(Online online, List<MultipartFile> videos, String webPath, String savePath);

	/** 클래스 수정 (썸머 테스트)
	 * @param online
	 * @return result
	 */
	int summerUpdateOnline(Online online, List<MultipartFile> videos, String webPath, String savePath, String deleteVideos);

	/** 클래스 삭제 (썸머 테스트)
	 * @param classNo
	 * @return result
	 */
	int summerDeleteOnline(int classNo);
	//=========================================================

	

}
