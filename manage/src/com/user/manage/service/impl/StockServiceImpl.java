package com.user.manage.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.manage.dao.StockDao;
import com.user.manage.model.StockModel;
import com.user.manage.service.StockService;

@Service
public class StockServiceImpl implements StockService {

	@Resource
    private StockDao stockDao;
	
	@Override
	public List<StockModel> selectList(String name, String company) {
		String hql = "from StockModel p where p.name = "+name+" and p.company = "+company;
		return stockDao.selectList(hql);
	}

	@Override
	public List<StockModel> selectListWithPage(int currentPage, int pageSize) {
		int pageFrom = (currentPage - 1) * pageSize;
		String hql = "from StockModel p ";
		return stockDao.selectListWithPage(hql, pageFrom, pageSize);
	}

	@Override
	public Serializable add(StockModel buy) {
		return stockDao.add(buy);
	}

	@Override
	public void delete(StockModel buy) {
		stockDao.del(buy);
	}

	@Override
	public void update(StockModel buy) {
		stockDao.update(buy);
	}

	@Override
	public Long count() {
		String hql = "select count(*) from StockModel p ";
		return stockDao.count(hql);
	}

	@Override
	public List<StockModel> select(String name) {
		String hql = "from StockModel p where p.name = "+name;
		return stockDao.selectList(hql);
	}

}
