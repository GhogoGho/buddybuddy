package edu.kh.bubby.online.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Payment;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 온라인 클래스 결제
	 * @param online
	 * @return result
	 */
	public int payment(Online online) {
		return sqlSession.insert("onlineMapper.payment", online);
	}

	/** 온라인 클래스 구매 회원 목록
	 * @param online
	 * @return
	 */
	public List<Payment> selectPaymentList(Payment onPayment) {
		return sqlSession.selectList("onlineMapper.selectPaymentList", onPayment);
	}
}
