package com.user.manage.dao;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.OutModel;

public interface OutDao {

	    Serializable add(OutModel buy);
		
		void del(OutModel buy);
		
		void update(OutModel buy);
		
		List<OutModel> selectList(String hql);
	 
	    List<OutModel> selectListWithPage(String hql, int pageFrom, int pageSize);
	 
	    Long count(String hql);
}
