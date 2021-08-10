package edu.kh.bubby.offline.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.offline.model.vo.OfflineClass;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
 
	/** 예약글 목록 조회
	 * @param offClass
	 * @return
	 */
	public List<OfflineClass> reserveSelectList(OfflineClass offClass) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("offlineMapper.reserveSelectList",offClass);
	}

	/**예약자 수 조회
	 * @param reserveNo
	 * @return
	 */
	public int reserveCount(int reserveNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("offlineMapper.reserveCount",reserveNo);
	}
}
