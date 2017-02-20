package com.user.manage.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.OutDao;
import com.user.manage.model.OutModel;

@Repository
public class OutDaoImpl implements OutDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Serializable add(OutModel buy) {
		return sessionFactory.getCurrentSession().save(buy);
	}

	@Override
	public void del(OutModel buy) {
		sessionFactory.getCurrentSession().delete(buy);
	}

	@Override
	public void update(OutModel buy) {
		sessionFactory.getCurrentSession().update(buy);
	}

	@Override
	public List<OutModel> selectList(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public List<OutModel> selectListWithPage(String hql, int pageFrom, int pageSize) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.setFirstResult(pageFrom).setMaxResults(pageSize).list();
	}

	@Override
	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();
	}

}
