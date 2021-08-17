package edu.kh.bubby.board.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.bubby.board.model.vo.NOTIBoard;
import edu.kh.bubby.board.model.vo.Pagination;
import edu.kh.bubby.board.model.vo.Search;

public interface BoardService {

	/** 전체 게시글 수 + 게시판 이름 조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);
	
	/** 전체 게시글 수 + 게시판 이름 조회(검색 시)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);

	/** 게시글 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	List<NOTIBoard> selectBoradList(Pagination pagination);
	
	/** 게시글 목록 조회(검색 시)
	 * @param search
	 * @param pagination
	 * @return boardList
	 */
	List<NOTIBoard> selectBoradList(Search search, Pagination pagination);

	/** 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	NOTIBoard selectBoard(int boardNo);

	/** 카테고리 목록 조회
	 * @return
	 */
//	List<Category> selectCategory();

	/** 게시글 삽입
	 * @param board
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @return boardNo
	 */
	int insertBoard(NOTIBoard board, List<MultipartFile> images, String webPath, String savePath);

	/** 게시글 수정을 위한 상세 조회
	 * @param boardNo
	 * @return board
	 */
	NOTIBoard selectUpdateBoard(int boardNo);

	/** 게시글 수정
	 * @param board
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @param deleteImages
	 * @return result
	 */
	int updateBoard(NOTIBoard board, List<MultipartFile> images, String webPath, String savePath, String deleteImages);

	/** 72시간 전 보다 과거에 추가된 파일명 조회
	 * @param standard
	 * @return dbList
	 */
	List<String> selectDbList(String standard);

	int deleteBoard(int notiNo);





}
