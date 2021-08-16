package edu.kh.bubby.offline.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.offline.model.vo.OffClassReport;
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

	/**예약할 예약번호 조회
	 * @param offClass
	 * @return
	 */
	public int selectReserveMemberNo(OfflineClass offClass) {
		// TODO Auto-generated method stub
		int reserveNo =0;
		OfflineClass off =sqlSession.selectOne("offlineMapper.selectReserveMemberNo",offClass);
		if(off !=null) {
			reserveNo = off.getReserveNo();
		}
		return reserveNo;
	}

	/**예약한사람 삽입
	 * @param offClass
	 * @return
	 */
	public int reserveInsert(OfflineClass offClass) {
		// TODO Auto-generated method stub
		int member = sqlSession.insert("offlineMapper.reserveInsert",offClass);
		if(member>0) {
			member=offClass.getReserveMemberNo();
		}else {
			member=0;
		}
		return member;
	}

	/**클래스 신고
	 * @param classReport
	 * @return
	 */
	public int reportClass(OffClassReport classReport) {
		// TODO Auto-generated method stub
		return sqlSession.insert("offClassReportMapper.reportClass",classReport);
	}

	public int insertPayment(OfflineClass offClass) {
		// TODO Auto-generated method stub
		return sqlSession.insert("offlineMapper.insertPayment",offClass);
	}

	public List<OfflineClass> dateSelect(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("offlineMapper.dateSelect",classNo);
	}

}
