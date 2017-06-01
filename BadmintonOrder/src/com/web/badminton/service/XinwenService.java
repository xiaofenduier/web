package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.Xinwen;

public interface XinwenService {
	
	public int add(Xinwen xinwen);

	public int delete(Xinwen xinwen);

	public int update(Xinwen xinwen);

	public List<Xinwen> selectList(Xinwen xinwen, int start, int pageSize);
	
	public Xinwen selectbyid(Xinwen xinwen);

	long count(Xinwen xinwen);
}
