package com.web.order.service;

import java.util.List;

import com.web.order.model.Information;

public interface InformationService {
	
	List<Information> select(Information information);

	int insert(Information information);

	int update(Information information);

	int delete(Information information);

	long count(Information information);
}
