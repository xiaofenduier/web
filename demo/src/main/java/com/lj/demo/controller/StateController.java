package com.lj.demo.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.State;
import com.lj.demo.service.StateService;

/** 
* @author liujie 
* @version 创建时间：2017年9月18日 上午10:46:27 
* 类说明 
*/
@Controller
@RequestMapping("state")
public class StateController {

	@Autowired
	private StateService stateService;
	
	@RequestMapping("initState")
	@ResponseBody
	public List<State> getAllState(State state){
		return stateService.getStateByExample(state);
	}
}
