package edu.kh.bubby.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.kh.bubby.main.model.dao.MainDAO;
import edu.kh.bubby.main.model.vo.MainClass;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO dao;
	
	public List<MainClass> classList() {
		
		return dao.classList();
	}

}
