package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.OrderMapper;
import com.web.order.model.Order;
import com.web.order.model.OrderExample;
import com.web.order.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<Order> selectwithpage(Order order, int start, int pageSize) {
		OrderExample orderExample = new OrderExample();
		orderExample = buildOrderExample(order);
		orderExample.setLimit(pageSize);
		orderExample.setStart(start);
		return orderMapper.selectByExample(orderExample);
	}

	@Override
	public int insert(Order order) {
		return orderMapper.insert(order);
	}

	@Override
	public int update(Order order) {
		return orderMapper.updateByPrimaryKey(order);
	}

	@Override
	public int delete(Order order) {
		return orderMapper.deleteByPrimaryKey(order.getId());
	}

	@Override
	public long count(Order order) {
		OrderExample orderExample = new OrderExample();
		orderExample = buildOrderExample(order);
		return orderMapper.countByExample(orderExample);
	}

	private OrderExample buildOrderExample(Order order) {
		OrderExample noticeExample = new OrderExample();
		OrderExample.Criteria criteria = noticeExample.createCriteria();
		noticeExample.setOrderByClause("id desc");
		try{
			if(order.getId() != null){
				criteria.andIdEqualTo(order.getId());
			}
			if(order.getUsername() != null && order.getUsername() != ""){
				criteria.andUsernameEqualTo(order.getUsername());
			}
			if(order.getCpname() != null && order.getCpname() != ""){
				criteria.andCpnameEqualTo(order.getCpname());
			}
			if(order.getOrderdata() != null && order.getOrderdata() != ""){
				criteria.andOrderdataEqualTo(order.getOrderdata());
			}
			if(order.getEnforce() != null){
				criteria.andEnforceEqualTo(order.getEnforce());
			}
			if(order.getIspay() != null && order.getIspay() != ""){
				criteria.andIspayEqualTo(order.getIspay());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return noticeExample;
	}

	@Override
	public List<Order> select(Order order) {
		OrderExample orderExample = new OrderExample();
		orderExample = buildOrderExample(order);
		return orderMapper.selectByExample(orderExample);
	}
}
