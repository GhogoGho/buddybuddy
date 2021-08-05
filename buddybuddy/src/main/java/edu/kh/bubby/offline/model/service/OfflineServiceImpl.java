package edu.kh.bubby.offline.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.bubby.offline.model.dao.OfflineDAO;

@Service
public class OfflineServiceImpl implements OfflineService{

	@Autowired
	private OfflineDAO dao;
}
