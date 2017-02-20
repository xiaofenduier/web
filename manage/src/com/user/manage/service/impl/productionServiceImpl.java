package com.user.manage.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.user.manage.dao.productionDao;
import com.user.manage.model.productionModel;
import com.user.manage.service.productionService;

@Service
public class productionServiceImpl implements productionService {

	private static final Logger logger = Logger.getLogger(productionServiceImpl.class);
	
	@Resource
    private productionDao productionDao;

	@Override
	public Serializable add(productionModel production) {
		return productionDao.add(production);
	}

	@Override
	public void delete(productionModel production) {
		productionDao.del(production);
	}

	@Override
	public void update(productionModel production) {
		productionDao.update(production);
	}

	@Override
	public List<productionModel> selectList(int id) {
		String hql = "from productionModel p where p.id = "+id;
		return productionDao.selectList(hql);
	}

	@Override
	public List<productionModel> selectListWithPage(int currentPage, int pageSize) {
		int pageFrom = (currentPage - 1) * pageSize;
		String hql = "from productionModel p";
		return productionDao.selectListWithPage(hql, pageFrom, pageSize);
	}

	@Override
	public Long count() {
		String hql = "select count(*) from productionModel p";
		return productionDao.count(hql);
	}

}
