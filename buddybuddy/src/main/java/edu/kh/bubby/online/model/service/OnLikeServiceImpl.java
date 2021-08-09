package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.member.model.vo.Member;
import edu.kh.bubby.online.model.dao.OnLikeDAO;
import edu.kh.bubby.online.model.vo.OnLike;

@Service
public class OnLikeServiceImpl implements OnLikeService{
	@Autowired
	private OnLikeDAO dao;

	// 찜하기 누른 Member 목록
	@Override
	public List<Member> selectMemberList(int classNo) {
		return dao.selectMemberList(classNo);
	}
	// 찜하기 삽입, 삭제
	@Override
	public OnLike onlineLike(OnLike onLike) {
		OnLike onlineLike = dao.onlineLikeCheck(onLike);
		int result = 0;
		if(onlineLike != null) {
			result = 1;
		}
		if(result==0) {
			result = dao.onlineLike(onLike);
		}else {
			result = dao.onlineLikeCancel(onLike);
		}
		return onlineLike;
	}
	// 찜하기 수 카운트
	@Override
	public int onlineLikeCount(int classNo) {
		return dao.onlineLikeCount(classNo);
	}
	
	
}
