package edu.kh.bubby.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.bubby.main.model.vo.MainClass;



@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MainClass> classList() {
		
		return sqlSession.selectList("mainMapper.classList");
	}
}
