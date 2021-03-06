package com.web.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.ShopCar;
import com.web.order.service.ShopCarService;

@Controller
@RequestMapping("shopCar")
public class ShopCarController {

	@Autowired
	private ShopCarService shopCarService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(ShopCar shopCar){
		List<ShopCar> shopCar2 = shopCarService.select(shopCar);
		if (shopCar2.size() > 0){
			shopCar2.get(0).setNum(shopCar2.get(0).getNum() + 1);
			return shopCarService.update(shopCar2.get(0));
		}else{
			shopCar.setNum(1);
			return shopCarService.insert(shopCar);
		}
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(ShopCar shopCar){
		return shopCarService.delete(shopCar);
	}
	
	@ResponseBody
	@RequestMapping("clean")
	public int clean(ShopCar shopCar){
		shopCarService.clean(shopCar);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(int currentPage, int pageSize, ShopCar shopCar){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = shopCarService.count(shopCar);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		List<ShopCar> shopCarList = shopCarService.select(shopCar);
		map.put("data", shopCarList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
