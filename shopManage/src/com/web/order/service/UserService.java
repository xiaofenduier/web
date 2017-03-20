package com.web.order.service;

import java.util.List;

import com.web.order.model.User;

public interface UserService {
	
	List<User> selectwithpage(User user, int start, int pageSize);
	
	List<User> select(User user);
	
	void insert(User user);
	
	void update(User user);
	
	long count(User user);
}
