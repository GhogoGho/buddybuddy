package edu.kh.bubby.offline.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.offline.model.vo.OffAttachment;
import edu.kh.bubby.offline.model.vo.OffCategory;
import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OffSearch;
import edu.kh.bubby.offline.model.vo.OfflineClass;
import edu.kh.bubby.online.model.vo.Pagination;

/**
 * @author 82104
 *
 */
@Repository
public class OfflineDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**전체 게시글 수 조회
	 * @param classType
	 * @return
	 */
	public OffPagination getPagination(int classType) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("offlineMapper.getPagination",classType);
	}

	/**전체 게시글 수 조회(검색)
	 * @param search
	 * @return
	 */
	public OffPagination getPagination(OffSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("offlineMapper.getSearchPagination",search);
	}
	/**전체 게시글 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<OfflineClass> selectOfflinList(OffPagination pagination) {
		// TODO Auto-generated method stub
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("offlineMapper.selectOfflinList",pagination.getClassType(),rowBounds);
	}

	/**검색 게시글 목록 조회
	 * @param search
	 * @param pagination
	 * @return
	 */
	public List<OfflineClass> selectOfflinList(OffSearch search, OffPagination pagination) {
		// TODO Auto-generated method stub
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("offlineMapper.selectOfflinSearchList",search,rowBounds);
	}

	/**상세조회
	 * @param classNo
	 * @return
	 */
	public OfflineClass selectOfflinView(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("offlineMapper.selectOfflinView",classNo);
	}

	/**상세조회 컨탠트 조회
	 * @param classNo
	 * @return
	 */
	public OfflineClass selectContent(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("offlineMapper.selectContent",classNo);
	}

	/**오프라인클래스 삽입
	 * @param offlineClass
	 * @return
	 */
	public int insertOfflineClass(OfflineClass offlineClass) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("offlineMapper.insertOfflineClass",offlineClass);
		if(result>0) {
			return offlineClass.getClassNo();
		}else {
			return 0;
		}
	
	}

	/**예약 날짜 삽입
	 * @param reof
	 * @return
	 */
	public int insertReserveAll(OfflineClass reof) {
		// TODO Auto-generated method stub
		return sqlSession.insert("offlineMapper.insertReserveAll",reof);
	}

	/**오프라인클래스썸네일 소개사진
	 * @param atList
	 * @return
	 */
	public int insertAttachmentList(List<OffAttachment> atList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("offlineMapper.insertAttachmentList",atList);
	}

	/**클래스 삭제
	 * @param classNo
	 * @return
	 */
	public int deleteClass(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("offlineMapper.deleteClass",classNo);
	}

	public int deleteReserve(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("offlineMapper.deleteReserve",classNo);
	}

	public int deleteConfirmReserve(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("offlineMapper.deleteConfirmReserve",classNo);
	}
	//카테고리 조회
	public List<OffCategory> selectCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("offlineMapper.selectCategory");
	}
	
	/**예약 날짜 조회
	 * @param classNo
	 * @return
	 */
	public List<OfflineClass> selectReserveUpdate(int classNo) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("offlineMapper.selectReserveUpdate",classNo);
	}

	public int deleteAtt(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("offlineMapper.deleteAtt",classNo);
	}
	
	/**게시글 업데이트
	 * @param offlineClass
	 * @return
	 */
	public int updateClass(OfflineClass offlineClass) {
		// TODO Auto-generated method stub
		return sqlSession.update("offlineMapper.updateClass",offlineClass);
	}

	/**게시글 예약자 삭제를 위한 reserveNo조회
	 * @param deleteOff
	 * @return
	 */
	public int selectReserveNo(OfflineClass deleteOff) {
		// TODO Auto-generated method stub
		OfflineClass reserveNo = sqlSession.selectOne("offlineMapper.selectReserveNo",deleteOff);
		
		return reserveNo.getReserveNo();
	}

	/**예약자 삭제
	 * @param reserveNo
	 */
	public void deletReserveMember(int reserveNo) {
		// TODO Auto-generated method stub
		sqlSession.update("offlineMapper.deletReserveMember",reserveNo);
	}

	/**업데이트중 예약 삭제
	 * @param reserveNo
	 * @return
	 */
	public int updeleteReserve(int reserveNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("offlineMapper.updeleteReserve",reserveNo);
	}

}
