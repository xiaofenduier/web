package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.ShopMapper;
import com.web.order.model.Shop;
import com.web.order.model.ShopExample;
import com.web.order.service.ShopService;

@Service("shopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopMapper shopMapper;
	
	@Override
	public List<Shop> selectwithpage(Shop shop, int start, int pageSize) {
		ShopExample shopExample = new ShopExample();
		shopExample = buildShopExample(shop);
		shopExample.setLimit(pageSize);
		shopExample.setStart(start);
		return shopMapper.selectByExample(shopExample);
	}

	@Override
	public int insert(Shop shop) {
		return shopMapper.insert(shop);
	}

	@Override
	public int update(Shop shop) {
		return shopMapper.updateByPrimaryKey(shop);
	}

	@Override
	public int delete(Shop shop) {
		return shopMapper.deleteByPrimaryKey(shop.getId());
	}

	@Override
	public long count(Shop shop) {
		ShopExample shopExample = new ShopExample();
		shopExample = buildShopExample(shop);
		return shopMapper.countByExample(shopExample);
	}

	private ShopExample buildShopExample(Shop shop) {
		ShopExample shopExample = new ShopExample();
		ShopExample.Criteria criteria = shopExample.createCriteria();
		shopExample.setOrderByClause("id desc");
		try{
			if(shop.getId() != null){
				criteria.andIdEqualTo(shop.getId());
			}
			if(shop.getShopname() != null && shop.getShopname() != ""){
				criteria.andShopnameEqualTo(shop.getShopname());
			}
			if(shop.getIntroduce() != null && shop.getIntroduce() != ""){
				criteria.andIntroduceEqualTo(shop.getIntroduce());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return shopExample;
	}

	@Override
	public List<Shop> select(Shop shop) {
		ShopExample shopExample = new ShopExample();
		shopExample = buildShopExample(shop);
		return shopMapper.selectByExample(shopExample);
	}
}
