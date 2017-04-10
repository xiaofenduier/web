package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.InformationMapper;
import com.web.order.model.Information;
import com.web.order.model.InformationExample;
import com.web.order.service.InformationService;

@Service("informationService")
public class InformationServiceImpl implements InformationService {

	@Autowired
	private InformationMapper informationMapper;
	
	@Override
	public List<Information> select(Information information) {
		InformationExample informationExample = new InformationExample();
		informationExample = buildInformationExample(information);
		return informationMapper.selectByExample(informationExample);
	}

	@Override
	public int insert(Information information) {
		return informationMapper.insert(information);
	}

	@Override
	public int update(Information information) {
		return informationMapper.updateByPrimaryKey(information);
	}

	@Override
	public int delete(Information information) {
		return informationMapper.deleteByPrimaryKey(information.getId());
	}

	@Override
	public long count(Information information) {
		InformationExample informationExample = new InformationExample();
		informationExample = buildInformationExample(information);
		return informationMapper.countByExample(informationExample);
	}

	private InformationExample buildInformationExample(Information information) {
		InformationExample informationExample = new InformationExample();
		InformationExample.Criteria criteria = informationExample.createCriteria();
		informationExample.setOrderByClause("id desc");
		try{
			if(information.getTitle() != null){
				criteria.andTitleLike("%" + information.getTitle() + "%");
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return informationExample;
	}
}
