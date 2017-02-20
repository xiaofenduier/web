package com.user.manage.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.user.manage.model.productionModel;

public interface productionDao {

    Serializable add(productionModel production);
	
	void del(productionModel production);
	
	void update(productionModel production);
	
	productionModel select(String hql, Map<String, Object> params);
	
	List<productionModel> selectList(String hql);
	 
    List<productionModel> selectList(String hql, Map<String, Object> params);
 
    List<productionModel> selectListWithPage(String hql, int page, int rows);
 
    List<productionModel> selectList(String hql, Map<String, Object> params, int page, int rows);
    
    Long count(String hql);
}
