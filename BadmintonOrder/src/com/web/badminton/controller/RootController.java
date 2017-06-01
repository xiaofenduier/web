package com.web.badminton.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.badminton.model.Root;
import com.web.badminton.service.RootService;

@Controller
@RequestMapping("/root")
public class RootController {

	@Autowired
	private RootService rootService;
	
	@ResponseBody
	@RequestMapping("login")
	public List<Root> login(Root root, HttpServletRequest request){
		int start = 0;
		int pageSize = 5;
		List<Root> rootList = new ArrayList<Root>();
		rootList = rootService.selectList(root, start, pageSize);
		if(rootList.size() > 0){
			request.getSession().setAttribute("rootObj", rootList.get(0));
		}
		return rootList;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Root select(Root root){
		int start = 0;
		int pageSize = 5;
		List<Root> rootList = new ArrayList<Root>();
		rootList = rootService.selectList(root, start, pageSize);
		if(rootList.size() > 0){
			return rootList.get(0);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("islogin")
	public Map<String, Object> islogin(HttpServletRequest request){
		Root root = (Root) request.getSession().getAttribute("rootObj");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", root);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("add")
	public int add(Root root){
		return rootService.add(root);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(Root root){
		return rootService.delete(root);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(Root root){
		return rootService.update(root);
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(Root root, int currentPage, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = rootService.count(root);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<Root> rootList = new ArrayList<Root>();
		rootList = rootService.selectList(root, start, pageSize);
		map.put("data", rootList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
