package com.user.manage.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.StockDao;
import com.user.manage.model.StockModel;

@Repository
public class StockDaoImpl implements StockDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Serializable add(StockModel stock) {
		return sessionFactory.getCurrentSession().save(stock);
	}

	@Override
	public void del(StockModel stock) {
		sessionFactory.getCurrentSession().delete(stock);
	}

	@Override
	public void update(StockModel stock) {
		sessionFactory.getCurrentSession().update(stock);
	}

	@Override
	public List<StockModel> selectList(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public List<StockModel> selectListWithPage(String hql, int pageFrom, int pageSize) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.setFirstResult(pageFrom).setMaxResults(pageSize).list();
	}

	@Override
	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();
	}

}
