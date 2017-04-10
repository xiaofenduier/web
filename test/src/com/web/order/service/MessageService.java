package com.web.order.service;

import java.util.List;

import com.web.order.model.Message;

public interface MessageService {

	List<Message> selectwithpage(Message message, int start, int pageSize);
	
	Message select(Message message);

	int insert(Message message);
	
	int update(Message message);
	
	int delete(Message message);
	
	long count(Message message);
}
