package edu.kh.bubby.creater.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.creater.model.dao.CreaterDAO;

@Service
public class CreaterServiceImpl implements CreaterService{

	@Autowired
	private CreaterDAO dao;
	
}
