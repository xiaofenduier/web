package com.user.manage.dao;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.BuyModel;

public interface BuyDao {

    Serializable add(BuyModel buy);
	
	void del(BuyModel buy);
	
	void update(BuyModel buy);
	
	List<BuyModel> selectList(String hql);
 
    List<BuyModel> selectListWithPage(String hql, int pageFrom, int pageSize);
 
    Long count(String hql);
}
