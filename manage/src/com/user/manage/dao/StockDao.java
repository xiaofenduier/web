package com.user.manage.dao;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.StockModel;

public interface StockDao {

Serializable add(StockModel stock);
	
	void del(StockModel stock);
	
	void update(StockModel stock);
	
	List<StockModel> selectList(String hql);
 
    List<StockModel> selectListWithPage(String hql, int pageFrom, int pageSize);
 
    Long count(String hql);
}
