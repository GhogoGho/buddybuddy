package edu.kh.bubby.offline.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.offline.model.vo.OffPagination;
import edu.kh.bubby.offline.model.vo.OfflineClass;
import edu.kh.bubby.online.model.vo.Pagination;

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
}
