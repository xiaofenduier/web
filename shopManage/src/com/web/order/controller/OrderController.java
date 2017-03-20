package com.web.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.Cp;
import com.web.order.model.Order;
import com.web.order.service.CpService;
import com.web.order.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CpService cpService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Order order){
		List<Order> order2 = orderService.select(order);
		if (order2.size() > 0){
			order2.get(0).setNum(order2.get(0).getNum() + 1);
			return orderService.update(order2.get(0));
		}else{
			order.setNum(1);
			order.setIspay("0");
			order.setEnforce(0);
			Date now = new Date();
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH");
			String time=formatter.format(now);
			order.setOrderdata(time);
			return orderService.insert(order);
		}
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Order order){
		return orderService.update(order);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Order order){
		return orderService.delete(order);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, Order order){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = orderService.count(order);
		if (currentPage == -1 && pageSize == -1){
			map.put("count", count);
			return map;
		}
		int start = (currentPage-1) * pageSize;
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		List<Order> orderList = orderService.selectwithpage(order, start, pageSize);
		map.put("data", orderList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(Order order){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Order> order2 = orderService.select(order);
		map.put("data", order2);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpageforcar")
	public Map<String, Object> selectwithpageforcar(int currentPage, int pageSize, Order order){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = orderService.count(order);
		if (currentPage == -1 && pageSize == -1){
			map.put("count", count);
			return map;
		}
		int start = (currentPage-1) * pageSize;
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		List<Order> orderList = orderService.selectwithpage(order, start, pageSize);
		for(Order o : orderList){
			Cp c = new Cp();
			c.setGoodsname(o.getCpname());
			Cp cp = cpService.select(c);
			o.setBz(cp.getNowprice().toString());
		}
		map.put("data", orderList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
