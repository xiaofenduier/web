package com.user.manage.dao;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.UserModel;

public interface UserDao {

	    Serializable add(UserModel buy);
		
		void del(UserModel buy);
		
		void update(UserModel buy);
		
		List<UserModel> selectList(String hql);
	 
	    List<UserModel> selectListWithPage(String hql, int pageFrom, int pageSize);
	 
	    Long count(String hql);
 
}
