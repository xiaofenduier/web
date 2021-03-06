package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.ShopCarMapper;
import com.web.order.model.ShopCar;
import com.web.order.model.ShopCarExample;
import com.web.order.service.ShopCarService;

@Service("shopCarService")
public class ShopCarServiceImpl implements ShopCarService {

	@Autowired
	private ShopCarMapper shopCarMapper;
	
	@Override
	public List<ShopCar> select(ShopCar shopCar) {
		ShopCarExample shopCarExample = new ShopCarExample();
		shopCarExample = buildShopCarExample(shopCar);
		return shopCarMapper.selectByExample(shopCarExample);
	}

	@Override
	public int insert(ShopCar shopCar) {
		return shopCarMapper.insert(shopCar);
	}

	@Override
	public int delete(ShopCar shopCar) {
		ShopCarExample shopCarExample = new ShopCarExample();
		shopCarExample = buildShopCarExample(shopCar);
		return shopCarMapper.deleteByExample(shopCarExample);
	}

	@Override
	public long count(ShopCar shopCar) {
		ShopCarExample shopCarExample = new ShopCarExample();
		shopCarExample = buildShopCarExample(shopCar);
		return shopCarMapper.countByExample(shopCarExample);
	}

	private ShopCarExample buildShopCarExample(ShopCar shopCar) {
		ShopCarExample shopCarExample = new ShopCarExample();
		ShopCarExample.Criteria criteria = shopCarExample.createCriteria();
		shopCarExample.setOrderByClause("id desc");
		try{
			if(shopCar.getUsername() != null){
				criteria.andUsernameEqualTo(shopCar.getUsername());
			}
			if(shopCar.getCpname() != null){
				criteria.andCpnameEqualTo(shopCar.getCpname());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return shopCarExample;
	}

	@Override
	public int update(ShopCar shopCar) {
		return shopCarMapper.updateByPrimaryKey(shopCar);
	}

	@Override
	public void clean(ShopCar shopCar) {
		shopCarMapper.deleteByPrimaryKey(shopCar.getId());
	}
}
