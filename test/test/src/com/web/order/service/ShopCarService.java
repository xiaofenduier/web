package com.web.order.service;

import java.util.List;

import com.web.order.model.ShopCar;

public interface ShopCarService {

	List<ShopCar> select(ShopCar shopCar);

	int insert(ShopCar shopCar);

	int delete(ShopCar shopCar);
	
	int update(ShopCar shopCar);
	
	long count(ShopCar shopCar);

	void clean(ShopCar shopCar);
}
