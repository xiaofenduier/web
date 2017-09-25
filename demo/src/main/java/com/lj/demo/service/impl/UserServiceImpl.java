package com.lj.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.UserMapper;
import com.lj.demo.model.User;
import com.lj.demo.model.UserExample;
import com.lj.demo.service.UserService;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午2:39:09 
* 类说明 
*/
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> getUserByUserModel(User user, String orderType , String orderName) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user, orderType, orderName);
		return userMapper.selectByExample(userExample);
	}
	
	private UserExample buildUserExample(User user, String orderType , String orderName){
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		userExample.setOrderByClause(orderName + " " + orderType);
		if(user.getId() != null){
			criteria.andIdEqualTo(user.getId());
		}
		if(user.getMail() != null){
			criteria.andMailEqualTo(user.getMail());
		}
		if(user.getName() != null){
			criteria.andNameLike(user.getName());
		}
		if(user.getPassword() != null){
			criteria.andPasswordEqualTo(user.getPassword());
		}
		if(user.getRoleid() != null){
			criteria.andRoleidEqualTo(user.getRoleid());
		}
		if(user.getStateid() != null){
			criteria.andStateidEqualTo(user.getStateid());
		}
		if(user.getTelphone() != null){
			criteria.andTelphoneEqualTo(user.getTelphone());
		}
		if(user.getUsername() != null){
			criteria.andUsernameLike(user.getUsername());
		}
		return userExample;
	}

	@Override
	public long countUserByUserModel(User user, String orderType , String orderName) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user, orderType, orderName);
		return userMapper.countByExample(userExample);
	}

	@Override
	public List<User> getUserListWithPage(User user, int currentPage, int pageSize, String orderType , String orderName) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user, orderType, orderName);
		if(currentPage != -1 && pageSize != -1){
			userExample.setCurrentPage(currentPage);
			userExample.setPageSize(pageSize);
		}
		return userMapper.selectByExample(userExample);
	}

	@Override
	public int addUser(User user) {
		return userMapper.insert(user);
	}
}
