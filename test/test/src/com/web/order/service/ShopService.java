package com.web.order.service;

import java.util.List;

import com.web.order.model.Shop;

public interface ShopService {
	List<Shop> selectwithpage(Shop shop, int start, int pageSize);

	List<Shop> select(Shop shop);

	int insert(Shop shop);

	int update(Shop shop);

	int delete(Shop shop);

	long count(Shop shop);
}
