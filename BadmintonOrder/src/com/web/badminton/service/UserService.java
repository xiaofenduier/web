package com.web.badminton.service;

import java.util.List;

import com.web.badminton.model.User;

public interface UserService {

	public int add(User user);
	
	public int delete(User user);
	
	public int update(User user);
	
	public List<User> selectList(User user, int start, int pageSize);
	
	long count(User user);

	User selectbyid(User user);
}
