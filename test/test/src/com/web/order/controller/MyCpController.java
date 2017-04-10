package com.web.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.web.order.model.MyCp;
import com.web.order.service.MyCpService;

@Controller
@RequestMapping("/myCp")
public class MyCpController {

	@Autowired
	private MyCpService myCpService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(MyCp myCp){
		return myCpService.insert(myCp);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(MyCp myCp){
		return myCpService.update(myCp);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(MyCp myCp){
		return myCpService.delete(myCp);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, MyCp myCp){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = myCpService.count(myCp);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<MyCp> myCpList = myCpService.selectwithpage(myCp, start, pageSize);
		map.put("data", myCpList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}

	@ResponseBody
	@RequestMapping("selectall")
	public List<MyCp> selectall(MyCp myCp){
		return myCpService.selectall(myCp);
	}
	
	@ResponseBody
	@RequestMapping("select")
	public MyCp select(MyCp myCp){
		return myCpService.selectone(myCp);
	}
}
