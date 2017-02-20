package com.user.manage.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.RoleDao;
import com.user.manage.model.RoleModel;

@Repository
public class RoleDaoImpl implements RoleDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public List<RoleModel> selectList(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

}
