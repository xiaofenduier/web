package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.Root;

public interface RootService {

	public int add(Root root);
	
	public int delete(Root root);
	
	public int update(Root root);
	
	public List<Root> selectList(Root root, int start, int pageSize);
	
	long count(Root root);
}
