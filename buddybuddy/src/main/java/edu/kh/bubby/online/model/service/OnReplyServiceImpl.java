package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.online.model.dao.OnReplyDAO;
import edu.kh.bubby.online.model.vo.OnReply;

@Service
public class OnReplyServiceImpl implements OnReplyService{
	@Autowired
	private OnReplyDAO dao;
	
	// 수강문의 목록 조회
	@Override
	public List<OnReply> selectList(int classNo) {
		return dao.selectList(classNo);
	}
}
