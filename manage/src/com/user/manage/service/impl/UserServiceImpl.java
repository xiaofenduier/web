package com.user.manage.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.manage.dao.UserDao;
import com.user.manage.model.UserModel;
import com.user.manage.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
    private UserDao userDao;
	
	@Override
	public List<UserModel> selectList(String username, String password) {
		String hql = "from UserModel p where p.username = '"+username+"' and p.password ="+password ;
		return userDao.selectList(hql);
	}

	@Override
	public List<UserModel> selectListWithPage(int currentPage, int pageSize) {
		int pageFrom = (currentPage - 1) * pageSize;
		String hql = "from UserModel p ";
		return userDao.selectListWithPage(hql, pageFrom, pageSize);
	}

	@Override
	public Serializable add(UserModel user) {
		return userDao.add(user);
	}

	@Override
	public void delete(UserModel user) {
		userDao.del(user);
		
	}

	@Override
	public void update(UserModel buy) {
		userDao.update(buy);
	}

	@Override
	public Long count() {
		String hql = "select count(*) from UserModel p ";
		return userDao.count(hql);
	}
}
