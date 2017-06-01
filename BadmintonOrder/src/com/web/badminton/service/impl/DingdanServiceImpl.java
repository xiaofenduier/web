package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.DingdanMapper;
import com.web.badminton.model.Dingdan;
import com.web.badminton.model.DingdanExample;
import com.web.badminton.service.DingdanService;

@Service("dingdanService")
public class DingdanServiceImpl implements DingdanService {

	@Autowired
	private DingdanMapper dingdanMapper;
	
	@Override
	public int add(Dingdan dingdan) {
		return dingdanMapper.insert(dingdan);
	}

	@Override
	public List<Dingdan> selectList(Dingdan dingdan, int start, int pageSize) {
		DingdanExample dingdanExample = new DingdanExample();
		dingdanExample = buildDingdanExample(dingdan);
		dingdanExample.setStart(start);
		dingdanExample.setLimit(pageSize);
		return dingdanMapper.selectByExample(dingdanExample);
	}

	@Override
	public long count(Dingdan dingdan) {
		DingdanExample dingdanExample = new DingdanExample();
		dingdanExample = buildDingdanExample(dingdan);
		return dingdanMapper.countByExample(dingdanExample);
	}

	private DingdanExample buildDingdanExample(Dingdan dingdan){
		DingdanExample dingdanExample = new DingdanExample();
		DingdanExample.Criteria criteria = dingdanExample.createCriteria();
		dingdanExample.setOrderByClause("id desc");
		if(dingdan.getChangdiid() != null){
			criteria.andChangdiidEqualTo(dingdan.getChangdiid());
		}
		if(dingdan.getUserid() != null){
			criteria.andUseridEqualTo(dingdan.getUserid());
		}
		return dingdanExample;
	}

	@Override
	public int delete(Dingdan dingdan) {
		return dingdanMapper.deleteByPrimaryKey(dingdan.getId());
	}

	@Override
	public int update(Dingdan dingdan) {
		return dingdanMapper.updateByPrimaryKeySelective(dingdan);
	}

	@Override
	public Dingdan selectbyid(Dingdan dingdan) {
		return dingdanMapper.selectByPrimaryKey(dingdan.getId());
	}
}
