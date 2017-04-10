package com.web.order.service;

import java.util.List;

import com.web.order.model.Cp;
import com.web.order.model.Vote;

public interface VoteService {

	List<Vote> select(Vote vote);
	
	List<Vote> select_cp_summar(Cp cp);

	int insert(Vote vote);

	int update(Vote vote);
	
	int delete(int id);
}
