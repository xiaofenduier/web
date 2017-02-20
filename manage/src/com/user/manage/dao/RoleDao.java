package com.user.manage.dao;

import java.util.List;

import com.user.manage.model.RoleModel;

public interface RoleDao {

	List<RoleModel> selectList(String hql);
}
