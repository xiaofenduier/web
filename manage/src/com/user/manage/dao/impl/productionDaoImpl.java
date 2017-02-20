package com.user.manage.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.manage.dao.productionDao;
import com.user.manage.model.productionModel;

@Repository
public class productionDaoImpl implements productionDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public Serializable add(productionModel production) {
		return sessionFactory.getCurrentSession().save(production);
	}

	@Override
	public void del(productionModel production) {
		sessionFactory.getCurrentSession().delete(production);
	}

	@Override
	public void update(productionModel production) {
		sessionFactory.getCurrentSession().update(production);
	}

	@Override
	public productionModel select(String hql, Map<String, Object> params) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		List<productionModel> l = q.list();
		if (l != null && l.size() > 0) {
			return l.get(0);
		}
		return null;
	}

	@Override
	public List<productionModel> selectList(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public List<productionModel> selectList(String hql, Map<String, Object> params) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.list();
	}

	@Override
	public List<productionModel> selectListWithPage(String hql, int pageFrom, int pageSize) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return q.setFirstResult(pageFrom).setMaxResults(pageSize).list();
	}

	@Override
	public List<productionModel> selectList(String hql, Map<String, Object> params, int page, int rows) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	@Override
	public Long count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) q.uniqueResult();
	}

}
