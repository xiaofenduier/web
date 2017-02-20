package com.user.manage.service;

import java.io.Serializable;
import java.util.List;

import com.user.manage.model.OutModel;

public interface OutService {

	    List<OutModel> selectList(int id);
		
		List<OutModel> selectListWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName);
		
		Serializable add(OutModel buy);
		 
	    void delete(OutModel buy);
	    
	    void update(OutModel buy);
	    
	    Long count(int state);
	    Long countwithstate(int staffId, int state);
}
