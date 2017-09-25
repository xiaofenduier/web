package com.lj.demo.service;

import java.util.List;

import com.lj.demo.model.User;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午2:36:58 
* 类说明 
*/
public interface UserService {

	public List<User> getUserByUserModel(User user, String orderType , String orderName);
	public long countUserByUserModel(User user, String orderType , String orderName);
	List<User> getUserListWithPage(User user, int start, int pageSize, String orderType , String orderName);
	
	public int addUser(User user);
}
