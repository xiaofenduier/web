package com.user.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.manage.model.BuyModel;
import com.user.manage.model.UserModel;
import com.user.manage.service.BuyService;

@Controller
@RequestMapping("/buy")
public class buyController {
	
	private static final Logger logger = Logger.getLogger(buyController.class);
	
	@Resource
	private BuyService buyService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		BuyModel buy = new BuyModel();
		String company = request.getParameter("company");
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		int state = 0;
		buy.setStaffId(staffId);
		buy.setState(state);
		buy.setCompany(company);
		buy.setNum(num);
		buy.setName(name);
		int result = 0;
		result = (int) buyService.add(buy);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("del")
	public int del(HttpServletRequest request){
		int result = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		BuyModel buy = new BuyModel();
		buy.setId(id);
		List<BuyModel> buyModelList = buyService.selectList(id);
		if (buyModelList.size() <= 0){
			result = 0;
		}
		buyService.delete(buy);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		int id = Integer.parseInt(request.getParameter("id"));
		List<BuyModel> buyModelList = buyService.selectList(id);
		result.put("value", buyModelList.get(0));
		return result;
	}
	
	@ResponseBody
	@RequestMapping("virtify")
	public int update(HttpServletRequest request) throws Exception{
		int result = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		int state = Integer.parseInt(request.getParameter("state"));
		int managerId = Integer.parseInt(request.getParameter("managerId"));
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		BuyModel buy = new BuyModel();
		String company = request.getParameter("company");
		buy.setState(state);
		buy.setManagerId(managerId);
		buy.setId(id);
		buy.setCompany(company);
		buy.setNum(num);
		buy.setName(name);
		buy.setStaffId(staffId);
		buyService.update(buy);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		List<BuyModel> buyModelList = buyService.selectListWithPage(currentPage, pageSize, state, peopleid, roleName);
		Long count = buyService.count(state);
		long pageCount = count/pageSize;
		long cy = count%pageSize;
		if(cy != 0){
			pageCount = pageCount + 1;
		}
		result.put("value", buyModelList);
		result.put("pageCount", pageCount);
		result.put("currentPage", currentPage);
		result.put("pageSize", pageSize);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("countwithstate")
	public Map<String, Object> countWithState(int staffId){
		Long dcount = buyService.countwithstate(-1, 0);
		Long rcount = buyService.countwithstate(staffId, 2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("d", dcount);
		map.put("r", rcount);
		return map;
	}
}
