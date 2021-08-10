package edu.kh.bubby.offline.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.offline.model.dao.ReserveDAO;
import edu.kh.bubby.offline.model.vo.OfflineClass;

@Service
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveDAO dao;
	//예약글 목록 조회
	@Override
	public List<OfflineClass> reserveSelectList(OfflineClass offClass) {
		// TODO Auto-generated method stub
		return dao.reserveSelectList(offClass);
	}
	//예약자 수 조회
	@Override
	public int reserveCount(int reserveNo) {
		// TODO Auto-generated method stub
		return dao.reserveCount(reserveNo);
	}


}
