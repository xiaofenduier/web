package com.web.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.order.dao.MyCpMapper;
import com.web.order.model.MyCp;
import com.web.order.model.MyCpExample;
import com.web.order.service.MyCpService;

@Service("myCpService")
public class MyCpServiceImpl implements MyCpService {

	@Autowired
	private MyCpMapper myCpMapper;
	
	@Override
	public List<MyCp> selectwithpage(MyCp myCp, int start, int pageSize) {
		MyCpExample myCpExample = new MyCpExample();
		myCpExample = buildMyCpExample(myCp);
		myCpExample.setLimit(pageSize);
		myCpExample.setStart(start);
		return myCpMapper.selectByExample(myCpExample);
	}

	@Override
	public int insert(MyCp myCp) {
		return myCpMapper.insert(myCp);
	}

	@Override
	public int update(MyCp myCp) {
		return myCpMapper.updateByPrimaryKey(myCp);
	}

	@Override
	public int delete(MyCp myCp) {
		return myCpMapper.deleteByPrimaryKey(myCp.getId());
	}

	@Override
	public long count(MyCp myCp) {
		MyCpExample myCpExample = new MyCpExample();
		myCpExample = buildMyCpExample(myCp);
		return myCpMapper.countByExample(myCpExample);
	}

	private MyCpExample buildMyCpExample(MyCp myCp) {
		MyCpExample myCpExample = new MyCpExample();
		MyCpExample.Criteria criteria = myCpExample.createCriteria();
		myCpExample.setOrderByClause("id desc");
		try{
			if(myCp.getName() != null && myCp.getName() != ""){
				criteria.andNameEqualTo(myCp.getName());
			}
			if(myCp.getUsername() != null){
				criteria.andUsernameEqualTo(myCp.getUsername());
			}
		} catch (Exception e){
			System.out.println(e);
		}
		return myCpExample;
	}

	@Override
	public MyCp select(MyCp myCp) {
		MyCpExample myCpExample = new MyCpExample();
		myCpExample = buildMyCpExample(myCp);
		return myCpMapper.selectByExample(myCpExample).get(0);
	}

	@Override
	public List<MyCp> selectall(MyCp myCp) {
		MyCpExample myCpExample = new MyCpExample();
		myCpExample = buildMyCpExample(myCp);
		return myCpMapper.selectByExample(myCpExample);
	}

	@Override
	public MyCp selectone(MyCp myCp) {
		return myCpMapper.selectByPrimaryKey(myCp.getId());
	}
}
