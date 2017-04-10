package com.web.order.service;

import java.util.List;

import com.web.order.model.Cp;

public interface CpService {

	List<Cp> selectwithpage(Cp cp, int start, int pageSize);
	
	List<Cp> selectall(Cp cp);
	
	Cp select(Cp cp);

	int insert(Cp cp);

	int update(Cp cp);

	int delete(Cp cp);

	long count(Cp cp);
}
