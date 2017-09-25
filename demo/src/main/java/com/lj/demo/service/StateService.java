package com.lj.demo.service;

import java.util.List;

import com.lj.demo.model.State;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:08:19 
* 类说明 
*/
public interface StateService {
	public List<State> getStateByExample(State state);
	public String getStateById(int id);
	public int getIdByState(String state);
}
