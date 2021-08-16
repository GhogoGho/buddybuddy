package edu.kh.bubby.online.model.service;

import java.util.List;

import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Payment;

public interface PaymentService {

	/** 온라인 클래스 결제
	 * @param online
	 * @return
	 */
	int payment(Online online);

	/** 온라인 클래스 결제 회원 목록
	 * @param online
	 * @return payList
	 */
	List<Payment> selectPaymentList(Payment onPayment);

}
