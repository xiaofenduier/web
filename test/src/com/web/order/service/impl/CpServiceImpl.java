package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.CpMapper;
import com.web.order.model.Cp;
import com.web.order.model.CpExample;
import com.web.order.service.CpService;

@Service("cpService")
public class CpServiceImpl implements CpService {

	@Autowired
	private CpMapper cpMapper;
	
	@Override
	public List<Cp> selectwithpage(Cp cp, int start, int pageSize) {
		CpExample cpExample = new CpExample();
		cpExample = buildCpExample(cp);
		cpExample.setLimit(pageSize);
		cpExample.setStart(start);
		return cpMapper.selectByExample(cpExample);
	}

	@Override
	public int insert(Cp cp) {
		return cpMapper.insert(cp);
	}

	@Override
	public int update(Cp cp) {
		return cpMapper.updateByPrimaryKey(cp);
	}

	@Override
	public int delete(Cp cp) {
		return cpMapper.deleteByPrimaryKey(cp.getId());
	}

	@Override
	public long count(Cp cp) {
		CpExample cpExample = new CpExample();
		cpExample = buildCpExample(cp);
		return cpMapper.countByExample(cpExample);
	}

	private CpExample buildCpExample(Cp cp) {
		CpExample cpExample = new CpExample();
		CpExample.Criteria criteria = cpExample.createCriteria();
		cpExample.setOrderByClause("id desc");
		try{
			if(cp.getGoodsname() != null && cp.getGoodsname() != ""){
				criteria.andGoodsnameEqualTo(cp.getGoodsname());
			}
			if(cp.getNowprice() != null){
				criteria.andNowpriceEqualTo(cp.getNowprice());
			}
			if(cp.getNewgoods() != null){
				criteria.andNewgoodsEqualTo(cp.getNewgoods());
			}
			if(cp.getTypeid() != null){
				criteria.andTypeidEqualTo(cp.getTypeid());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return cpExample;
	}

	@Override
	public Cp select(Cp cp) {
		CpExample cpExample = new CpExample();
		cpExample = buildCpExample(cp);
		return cpMapper.selectByExample(cpExample).get(0);
	}

	@Override
	public List<Cp> selectall(Cp cp) {
		CpExample cpExample = new CpExample();
		cpExample = buildCpExample(cp);
		return cpMapper.selectByExample(cpExample);
	}
}
