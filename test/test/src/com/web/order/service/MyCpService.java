package com.web.order.service;

import java.util.List;

import com.web.order.model.MyCp;

public interface MyCpService {
	
	List<MyCp> selectwithpage(MyCp myCp, int start, int pageSize);

	List<MyCp> selectall(MyCp myCp);

	MyCp selectone(MyCp myCp);
	
	MyCp select(MyCp myCp);

	int insert(MyCp myCp);

	int update(MyCp myCp);

	int delete(MyCp myCp);

	long count(MyCp myCp);
}
