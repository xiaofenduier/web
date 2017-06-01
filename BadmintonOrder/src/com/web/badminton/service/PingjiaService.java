package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.Pingjia;

public interface PingjiaService {

	public int add(Pingjia pingjia);
	
	public int delete(Pingjia pingjia);
	
	public int update(Pingjia pingjia);
	
	public List<Pingjia> selectList(Pingjia pingjia, int start, int pageSize);
	
	long count(Pingjia pingjia);
	
	public List<Pingjia> selectbyscore();
}
