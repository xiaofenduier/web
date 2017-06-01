package com.web.badminton.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.badminton.dao.XinwenMapper;
import com.web.badminton.model.Xinwen;
import com.web.badminton.model.XinwenExample;
import com.web.badminton.service.XinwenService;

@Service("xinwenService")
public class XinwenServiceImpl implements XinwenService {

	@Autowired
	private XinwenMapper xinwenMapper;
	
	@Override
	public int add(Xinwen xinwen) {
		return xinwenMapper.insert(xinwen);
	}

	@Override
	public int delete(Xinwen xinwen) {
		return xinwenMapper.deleteByPrimaryKey(xinwen.getId());
	}

	@Override
	public int update(Xinwen xinwen) {
		return xinwenMapper.updateByPrimaryKeySelective(xinwen);
	}

	@Override
	public List<Xinwen> selectList(Xinwen xinwen, int start, int pageSize) {
		XinwenExample xinwenExample = new XinwenExample();
		xinwenExample = buildXinwenExample(xinwen);
		xinwenExample.setStart(start);
		xinwenExample.setLimit(pageSize);
		return xinwenMapper.selectByExample(xinwenExample);
	}

	@Override
	public long count(Xinwen xinwen) {
		XinwenExample xinwenExample = new XinwenExample();
		xinwenExample = buildXinwenExample(xinwen);
		return xinwenMapper.countByExample(xinwenExample);
	}
	
	private XinwenExample buildXinwenExample(Xinwen xinwen){
		XinwenExample xinwenExample = new XinwenExample();
		XinwenExample.Criteria criteria = xinwenExample.createCriteria();
		xinwenExample.setOrderByClause("id desc");
		if(xinwen.getTitle() != null){
			criteria.andTimeEqualTo(xinwen.getTitle());
		}
		if(xinwen.getContent() != null){
			criteria.andContentEqualTo("%" + xinwen.getContent() + "%");
		}
		if(xinwen.getTime() != null){
			criteria.andTimeEqualTo(xinwen.getTime());
		}
		return xinwenExample;
	}

	@Override
	public Xinwen selectbyid(Xinwen xinwen) {
		return xinwenMapper.selectByPrimaryKey(xinwen.getId());
	}

}
