package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.PingjiaMapper;
import com.web.badminton.model.Pingjia;
import com.web.badminton.model.PingjiaExample;
import com.web.badminton.service.PingjiaService;

@Service("pingjiaService")
public class PingjiaServiceImpl implements PingjiaService {

	@Autowired
	private PingjiaMapper pingjiaMapper;
	
	@Override
	public int add(Pingjia pingjia) {
		return pingjiaMapper.insert(pingjia);
	}

	@Override
	public List<Pingjia> selectList(Pingjia pingjia, int start, int pageSize) {
		PingjiaExample pingjiaExample = new PingjiaExample();
		pingjiaExample = buildPingjiaExample(pingjia);
		pingjiaExample.setStart(start);
		pingjiaExample.setLimit(pageSize);
		return pingjiaMapper.selectByExample(pingjiaExample);
	}

	@Override
	public long count(Pingjia pingjia) {
		PingjiaExample pingjiaExample = new PingjiaExample();
		pingjiaExample = buildPingjiaExample(pingjia);
		return pingjiaMapper.countByExample(pingjiaExample);
	}

	private PingjiaExample buildPingjiaExample(Pingjia pingjia){
		PingjiaExample pingjiaExample = new PingjiaExample();
		PingjiaExample.Criteria criteria = pingjiaExample.createCriteria();
		pingjiaExample.setOrderByClause("id desc");
		if(pingjia.getChangdiid() != null){
			criteria.andChangdiidEqualTo(pingjia.getChangdiid());
		}
		if(pingjia.getScore() != null){
			criteria.andScoreLessThan(pingjia.getScore());
		}
		return pingjiaExample;
	}

	@Override
	public int delete(Pingjia pingjia) {
		return pingjiaMapper.deleteByPrimaryKey(pingjia.getId());
	}

	@Override
	public int update(Pingjia pingjia) {
		return pingjiaMapper.updateByPrimaryKeySelective(pingjia);
	}

	@Override
	public List<Pingjia> selectbyscore() {
		return pingjiaMapper.selectbyscore();
	}
}
