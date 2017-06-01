package com.web.badminton.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.badminton.model.Pingjia;
import com.web.badminton.service.PingjiaService;

@Controller
@RequestMapping("/pingjia")
public class PingjiaController {

	@Autowired
	private PingjiaService pingjiaService;
	
	@ResponseBody
	@RequestMapping("select")
	public Pingjia select(Pingjia pingjia){
		int start = 0;
		int pageSize = 5;
		List<Pingjia> pingjiaList = new ArrayList<Pingjia>();
		pingjiaList = pingjiaService.selectList(pingjia, start, pageSize);
		if(pingjiaList.size() > 0){
			return pingjiaList.get(0);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Pingjia pingjia){
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(now);
		pingjia.setTime(time);
		return pingjiaService.add(pingjia);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Pingjia pingjia){
		return pingjiaService.delete(pingjia);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Pingjia pingjia){
		return pingjiaService.update(pingjia);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(Pingjia pingjia, int currentPage, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = pingjiaService.count(pingjia);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Pingjia> pingjiaList = new ArrayList<Pingjia>();
		pingjiaList = pingjiaService.selectList(pingjia, start, pageSize);
		map.put("data", pingjiaList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectbyscore")
	public List<Pingjia> selectbyscore(){
		return pingjiaService.selectbyscore();
	}
}
