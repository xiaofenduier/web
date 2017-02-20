package com.user.manage.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.BuyDao;
import com.user.manage.model.BuyModel;

@Repository
public class BuyDaoImpl implements BuyDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Serializable add(BuyModel buy) {
		return sessionFactory.getCurrentSession().save(buy);
	}

	@Override
	public void del(BuyModel buy) {
		sessionFactory.getCurrentSession().delete(buy);
	}

	@Override
	public void update(BuyModel buy) {
		sessionFactory.getCurrentSession().update(buy);
	}

	@Override
	public List<BuyModel> selectList(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public List<BuyModel> selectListWithPage(String hql, int pageFrom, int pageSize) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.setFirstResult(pageFrom).setMaxResults(pageSize).list();
	}

	@Override
	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();
	}

}
