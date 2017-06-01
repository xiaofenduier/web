package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.Dingdan;

public interface DingdanService {

	public int add(Dingdan dingdan);
	
	public int delete(Dingdan dingdan);
	
	public int update(Dingdan dingdan);
	
	public List<Dingdan> selectList(Dingdan dingdan, int start, int pageSize);
	
	public Dingdan selectbyid(Dingdan dingdan);
	
	long count(Dingdan dingdan);
}
