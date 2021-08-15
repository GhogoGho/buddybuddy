package edu.kh.bubby.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.bubby.main.model.vo.MainClass;


@Service
public interface MainService {

	public abstract List<MainClass> classList();

}
