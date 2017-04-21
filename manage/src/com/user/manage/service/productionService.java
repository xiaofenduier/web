package com.user.manage.service;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.productionModel;

public interface productionService {

	List<productionModel> selectList(int id);
	
	List<productionModel> selectListWithPage(int pageSize, int pageCount);
	
	Serializable add(productionModel production);
	 
    void delete(productionModel production);
    
    void update(productionModel production);
    
    Long count();
    
    List<productionModel> select(String name);
    
    List<productionModel> select4List();
}
