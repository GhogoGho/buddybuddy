package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.online.model.dao.PaymentDAO;
import edu.kh.bubby.online.model.vo.Online;
import edu.kh.bubby.online.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO dao;
	
	// 
	@Override
	public int payment(Online online) {
		return dao.payment(online);
	}

	// 클래스 구매 회원 목록 조회
	@Override
	public List<Payment> selectPaymentList(Payment onPayment) {
		return dao.selectPaymentList(onPayment);
	}

}
