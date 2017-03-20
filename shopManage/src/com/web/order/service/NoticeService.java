package com.web.order.service;

import java.util.List;

import com.web.order.model.Notice;

public interface NoticeService {

	List<Notice> selectwithpage(Notice notice, int start, int pageSize);
	
	Notice select(Notice notice);
	
	int insert(Notice notice);

	int update(Notice notice);
	
	int delete(Notice notice);
	
	long count(Notice notice);
}
