package com.user.manage.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.UserDao;
import com.user.manage.model.BuyModel;
import com.user.manage.model.UserModel;

@Repository
public class UserDaoImpl implements UserDao {

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public Serializable add(UserModel user) {
		return sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void del(UserModel user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public void update(UserModel user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserModel> selectList(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.list();
	}

	@Override
	public List<UserModel> selectListWithPage(String hql, int pageFrom, int pageSize) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.setFirstResult(pageFrom).setMaxResults(pageSize).list();
	}

	@Override
	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();
	}

}
