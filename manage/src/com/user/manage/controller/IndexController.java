package com.user.manage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.manage.service.BuyService;
import com.user.manage.service.OutService;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Resource
	private BuyService buyService;
	
	@Resource
	private OutService outService;
	
	@ResponseBody
	@RequestMapping("countwithstate")
	public Map<String, Object> countWithState(int staffId){
		Long outdCount = outService.countwithstate(-1, 0);
		Long outrCount = outService.countwithstate(staffId, 2);
		Long buydCount = buyService.countwithstate(-1, 0);
		Long buyrCount = buyService.countwithstate(staffId, 2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("outdCount", outdCount);
		map.put("outrCount", outrCount);
		map.put("buydCount", buydCount);
		map.put("buyrCount", buyrCount);
		return map;
	}
}
