package com.user.manage.service;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.StockModel;

public interface StockService {
	    List<StockModel> selectList(String name, String company);
		
		List<StockModel> selectListWithPage(int currentPage, int pageSize);
		
		Serializable add(StockModel buy);
		 
	    void delete(StockModel buy);
	    
	    void update(StockModel buy);
	    
	    Long count();
}
