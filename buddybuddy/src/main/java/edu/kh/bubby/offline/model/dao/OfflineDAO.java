package edu.kh.bubby.offline.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OfflineDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
