package com.user.manage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.manage.model.UserModel;
import com.user.manage.model.productionModel;
import com.user.manage.service.productionService;

@Controller
@RequestMapping("/production")
public class productionController {
	
	private static final Logger logger = Logger.getLogger(productionController.class);
	
	@Resource
	private productionService productionService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(HttpServletRequest request) throws Exception{
		String username = request.getParameter("username");
		int num = Integer.parseInt(request.getParameter("num"));
		String productionTimeStr = request.getParameter("productionTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		productionModel production = new productionModel();
		if(productionTimeStr != "" && productionTimeStr != null){
			Date productTime = sdf.parse(productionTimeStr);
			production.setProductTime(productTime);
		}
		int expirationTime = Integer.parseInt(request.getParameter("expirationTime"));
		String company = request.getParameter("company");
		String inTimeStr = request.getParameter("inTime");
		if(inTimeStr != "" && inTimeStr != null){
			Date inTime = sdf.parse(inTimeStr); 
			production.setInTime(inTime);
		}
		production.setCompany(company);
		production.setExpirationTime(expirationTime);
		production.setNum(num);
		production.setUsername(username);
		int result = 0;
		result = (int) productionService.add(production);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("del")
	public int del(HttpServletRequest request){
		int result = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		productionModel production = new productionModel();
		production.setId(id);
		List<productionModel> productionModelList = productionService.selectList(id);
		if (productionModelList.size() <= 0){
			result = 0;
		}
		productionService.delete(production);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		int id = Integer.parseInt(request.getParameter("id"));
		List<productionModel> productionModelList = productionService.selectList(id);
		result.put("value", productionModelList.get(0));
		return result;
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(HttpServletRequest request) throws Exception{
		int result = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		int num = Integer.parseInt(request.getParameter("num"));
		String productionTimeStr = request.getParameter("productionTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
		productionModel production = new productionModel();
		if(productionTimeStr != "" && productionTimeStr != null){
			Date productTime = sdf.parse(productionTimeStr);
			production.setProductTime(productTime);
		}
		int expirationTime = Integer.parseInt(request.getParameter("expirationTime"));
		String company = request.getParameter("company");
		String inTimeStr = request.getParameter("inTime");
		if(inTimeStr != "" && inTimeStr != null){
			Date inTime = sdf.parse(inTimeStr); 
			production.setInTime(inTime);
		}
		production.setId(id);
		production.setCompany(company);
		production.setExpirationTime(expirationTime);
		production.setNum(num);
		production.setUsername(username);
		productionService.update(production);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectWithPage(int currentPage, int pageSize, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		List<productionModel> productionModelList = productionService.selectListWithPage(currentPage, pageSize);
		Long count = productionService.count();
		long pageCount = count/pageSize;
		long cy = count%pageSize;
		if(cy != 0){
			pageCount = pageCount + 1;
		}
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		result.put("value", productionModelList);
		result.put("pageCount", pageCount);
		result.put("currentPage", currentPage);
		result.put("pageSize", pageSize);
		result.put("user", user);
		return result;
	}

}
