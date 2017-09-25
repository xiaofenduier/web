package com.lj.demo.service;

import java.util.Set;

import com.lj.demo.model.Login;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午4:25:49 
* 类说明 
*/
public interface LoginService {

	public int insert(Login login);
	
	public Set<String> getRoles(String telphone);
}
