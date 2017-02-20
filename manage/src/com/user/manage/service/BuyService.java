package com.user.manage.service;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.BuyModel;

public interface BuyService {

    List<BuyModel> selectList(int id);
	
	List<BuyModel> selectListWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName);
	
	Serializable add(BuyModel buy);
	 
    void delete(BuyModel buy);
    
    void update(BuyModel buy);
    
    Long count(int state);
    
    Long countwithstate(int staffId, int state);
}
