package com.user.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.manage.dao.RoleDao;
import com.user.manage.model.RoleModel;
import com.user.manage.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Resource
    private RoleDao roleDao;
	
	@Override
	public List<RoleModel> selectList() {
		String hql = "from RoleModel p";
		return roleDao.selectList(hql);
	}

}
