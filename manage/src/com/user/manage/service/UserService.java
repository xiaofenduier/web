package com.user.manage.service;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.UserModel;

public interface UserService {

    List<UserModel> selectList(String username, String password);
	
	List<UserModel> selectListWithPage(int currentPage, int pageSize);
	
	Serializable add(UserModel buy);
	 
    void delete(UserModel buy);
    
    void update(UserModel buy);
    
    Long count();
    
}
