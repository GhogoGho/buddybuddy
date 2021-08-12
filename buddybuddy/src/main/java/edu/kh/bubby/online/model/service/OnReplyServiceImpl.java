package edu.kh.bubby.online.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	// 수강문의 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(OnReply reply) {
		reply.setReplyContent(OnlineServiceImpl.replaceParameter(reply.getReplyContent()));
		reply.setReplyContent(reply.getReplyContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.insertReply(reply);
	}

	// 수강문의 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(OnReply reply) {
		reply.setReplyContent(OnlineServiceImpl.replaceParameter(reply.getReplyContent()));
		reply.setReplyContent(reply.getReplyContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.updateReply(reply);
	}
	
	// 수강문의 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}
	
	// 수강문의 대댓글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertComment(OnReply reply) {
		reply.setNestedReply(OnlineServiceImpl.replaceParameter(reply.getNestedReply()));
		reply.setNestedReply(reply.getNestedReply().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.insertComment(reply);
	}
	// 수강문의 대댓글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateComment(OnReply reply) {
		reply.setNestedReply(OnlineServiceImpl.replaceParameter(reply.getNestedReply()));
		reply.setNestedReply(reply.getNestedReply().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.updateComment(reply);
	}
	// 수강문의 대댓글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteComment(OnReply reply) {
		reply.setNestedReply(OnlineServiceImpl.replaceParameter(reply.getNestedReply()));
		reply.setNestedReply(reply.getNestedReply().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.deleteComment(reply);
	}
	
	
	
}
