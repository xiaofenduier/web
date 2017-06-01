package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.ChangdiMapper;
import com.web.badminton.model.Changdi;
import com.web.badminton.model.ChangdiExample;
import com.web.badminton.service.ChangdiService;

@Service("changdiService")
public class ChangdiServiceImpl implements ChangdiService {

	@Autowired
	private ChangdiMapper changdiMapper;
	
	@Override
	public int add(Changdi changdi) {
		return changdiMapper.insert(changdi);
	}

	@Override
	public int delete(Changdi changdi) {
		return changdiMapper.deleteByPrimaryKey(changdi.getId());
	}

	@Override
	public int update(Changdi changdi) {
		return changdiMapper.updateByPrimaryKey(changdi);
	}

	@Override
	public List<Changdi> selectList(Changdi changdi, int start, int pageSize) {
		ChangdiExample changdiExample = new ChangdiExample();
		changdiExample = buildChangdiExample(changdi);
		changdiExample.setStart(start);
		changdiExample.setLimit(pageSize);
		return changdiMapper.selectByExample(changdiExample);
	}

	@Override
	public long count(Changdi changdi) {
		ChangdiExample changdiExample = new ChangdiExample();
		changdiExample = buildChangdiExample(changdi);
		return changdiMapper.countByExample(changdiExample);
	}
	
	private ChangdiExample buildChangdiExample(Changdi changdi){
		ChangdiExample changdiExample = new ChangdiExample();
		ChangdiExample.Criteria criteria = changdiExample.createCriteria();
		changdiExample.setOrderByClause("id desc");
		if(changdi.getName() != null){
			criteria.andNameLike("%" + changdi.getName() + "%");
		}
		if(changdi.getAddress() != null){
			criteria.andAddressLike("%" + changdi.getAddress() + "%");
		}
		if(changdi.getPrice() != null){
			criteria.andPriceLessThan(changdi.getPrice());
		}
		return changdiExample;
	}

	@Override
	public Changdi selectbyid(Changdi changdi) {
		return changdiMapper.selectByPrimaryKey(changdi.getId());
	}

}
