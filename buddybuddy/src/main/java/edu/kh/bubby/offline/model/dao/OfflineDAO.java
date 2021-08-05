package edu.kh.bubby.offline.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.online.model.vo.Pagination;

@Repository
public class OfflineDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Pagination getPagination(int classType) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("");
	}
}
