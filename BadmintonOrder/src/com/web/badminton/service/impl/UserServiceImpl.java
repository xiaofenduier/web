package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.UserMapper;
import com.web.badminton.model.User;
import com.web.badminton.model.UserExample;
import com.web.badminton.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int add(User user) {
		return userMapper.insert(user);
	}

	@Override
	public List<User> selectList(User user, int start, int pageSize) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user);
		userExample.setStart(start);
		userExample.setLimit(pageSize);
		return userMapper.selectByExample(userExample);
	}

	@Override
	public long count(User user) {
		UserExample userExample = new UserExample();
		userExample = buildUserExample(user);
		return userMapper.countByExample(userExample);
	}

	private UserExample buildUserExample(User user){
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		userExample.setOrderByClause("id desc");
		if(user.getTelphone() != null){
			criteria.andTelphoneEqualTo(user.getTelphone());
		}
		if(user.getUsername() != null){
			criteria.andUsernameEqualTo(user.getUsername());
		}
		if(user.getRealname() != null){
			criteria.andRealnameLike("%" + user.getRealname() +"%");
		}
		if(user.getPassword() != null){
			criteria.andPasswordEqualTo(user.getPassword());
		}
		return userExample;
	}

	@Override
	public int delete(User user) {
		return userMapper.deleteByPrimaryKey(user.getId());
	}

	@Override
	public int update(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}
	
	@Override
	public User selectbyid(User user) {
		return userMapper.selectByPrimaryKey(user.getId());
	}
}
