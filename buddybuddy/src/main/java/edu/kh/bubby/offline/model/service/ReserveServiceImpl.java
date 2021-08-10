package edu.kh.bubby.offline.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.bubby.offline.exception.ViewInsertReserveException;
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
	//예약하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reserveInsert(OfflineClass offClass, int insertNum) {
		// TODO Auto-generated method stub
		//예약할 번호 찾기
		int reserveNo = dao.selectReserveMemberNo(offClass);
		int count=0;
		if(reserveNo>0) {
			offClass.setReserveNo(reserveNo);
			if(insertNum>0) {
				for(int i=0;i<insertNum;i++) {
				int result =dao.reserveInsert(offClass);
				if(result>0) {
					count++;
				}
				}
				if(count!=insertNum) {
					throw new ViewInsertReserveException();
				}
				
			}
			
		}else {
			throw new ViewInsertReserveException();
		}
		
		return 1;
	}


}
