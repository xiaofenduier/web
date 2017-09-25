package com.lj.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.StateMapper;
import com.lj.demo.model.State;
import com.lj.demo.model.StateExample;
import com.lj.demo.service.StateService;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:05:35 
* 类说明 
*/
@Service("stateService")
public class StateServiceImpl implements StateService {

	@Autowired
	private StateMapper stateMapper;
	
	@Override
	public List<State> getStateByExample(State state) {
		StateExample stateExample = new StateExample();
		stateExample = buildStateExample(state);
		return stateMapper.selectByExample(stateExample);
	}

	private StateExample buildStateExample(State state){
		StateExample stateExample = new StateExample();
		StateExample.Criteria criteria = stateExample.createCriteria();
		stateExample.setOrderByClause("id desc");
		if(state.getId() != null){
			criteria.andIdEqualTo(state.getId());
		}
		
		if(state.getState() != null){
			criteria.andStateLike(state.getState());
		}
		return stateExample;
	}

	@Override
	public String getStateById(int id) {
		return stateMapper.selectByPrimaryKey(id).getState();
	}

	@Override
	public int getIdByState(String state) {
		return stateMapper.selectIdByState(state);
	}
}
