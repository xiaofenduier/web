package com.web.order.service;

import java.util.List;

import com.web.order.model.Order;

public interface OrderService {

    List<Order> selectwithpage(Order order, int start, int pageSize);
    
    List<Order> select(Order order);
	
	int insert(Order order);

	int update(Order order);
	
	int delete(Order order);
	
	long count(Order order);
}
