package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.UserMapper;
import com.web.order.model.UserExample;
import com.web.order.model.User;
import com.web.order.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<User> select(User user) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample2(user);
		return userMapper.selectByExample(userExample);
	}

	@Override
	public void insert(User user) {
		userMapper.insert(user);
	}

	private UserExample buildUserExample(User user) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		try{
			if(user.getUsername() != null && user.getUsername() != ""){
				criteria.andUsernameLike(user.getUsername());
			}
			if(user.getPassword() != null && user.getPassword() != ""){
				criteria.andPasswordEqualTo(user.getPassword());
			}
			if(user.getPhone() != null && user.getPhone() != ""){
				criteria.andPhoneLike(user.getPhone());
			}
			if(user.getName() != null && user.getName() != ""){
				criteria.andNameLike(user.getName());
			}
			if(user.getAddress() != null && user.getAddress() != ""){
				criteria.andAddressLike(user.getAddress());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return userExample;
	}
	
	private UserExample buildUserExample2(User user) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		try{
			if(user.getUsername() != null && user.getUsername() != ""){
				criteria.andUsernameEqualTo(user.getUsername());
			}
			if(user.getPassword() != null && user.getPassword() != ""){
				criteria.andPasswordEqualTo(user.getPassword());
			}
			if(user.getPhone() != null && user.getPhone() != ""){
				criteria.andPhoneEqualTo(user.getPhone());
			}
			if(user.getName() != null && user.getName() != ""){
				criteria.andNameEqualTo(user.getName());
			}
			if(user.getAddress() != null && user.getAddress() != ""){
				criteria.andAddressEqualTo(user.getAddress());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return userExample;
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public List<User> selectwithpage(User user, int start, int pageSize) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user);
		userExample.setLimit(pageSize);
		userExample.setStart(start);
		return userMapper.selectByExample(userExample);
	}

	@Override
	public long count(User user) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user);
		return userMapper.countByExample(userExample);
	}
	
}
