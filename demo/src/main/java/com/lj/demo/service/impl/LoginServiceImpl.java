package com.lj.demo.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.LoginMapper;
import com.lj.demo.model.Login;
import com.lj.demo.service.LoginService;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午4:26:05 
* 类说明 
*/
@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public int insert(Login login) {
		return loginMapper.insert(login);
	}

	@Override
	public Set<String> getRoles(String telphone) {
		return loginMapper.getRoles(telphone);
	}
	
}
