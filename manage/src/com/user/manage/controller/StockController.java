package com.user.manage.controller;

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

import com.user.manage.model.StockModel;
import com.user.manage.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockController {
private static final Logger logger = Logger.getLogger(buyController.class);
	
	@Resource
	private StockService stockService;
	
	@ResponseBody
	@RequestMapping("in")
	public int add(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		StockModel stock = new StockModel();
		Date inTime = new Date();
		stock.setInTime(inTime);
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		String company = request.getParameter("company");
		stock.setStaffId(staffId);
		stock.setNum(num);
		stock.setName(name);
		stock.setCompany(company);
		int result = 0;
		List<StockModel> stockModelList = stockService.selectList(name, company);
		if(stockModelList.size() > 0){
			int id = stockModelList.get(0).getId();
			int count = stockModelList.get(0).getNum() + num;
			stock.setNum(count);
			stock.setId(id);
			stockService.update(stock);
			result = 1;
		}else{
			result = (int) stockService.add(stock);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("out")
	public int out(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		StockModel stock = new StockModel();
		Date outTime = new Date();
		stock.setOutTime(outTime);
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		String company = request.getParameter("company");
		stock.setStaffId(staffId);
		stock.setNum(num);
		stock.setName(name);
		stock.setCompany(company);
		int result = 0;
		List<StockModel> stockModelList = stockService.selectList(name, company);
		if(stockModelList.size() > 0){
			int id = stockModelList.get(0).getId();
			int count = stockModelList.get(0).getNum() - num;
			if(count < 0){
				return result;
			}else{
				stock.setNum(count);
				stock.setId(id);
				stockService.update(stock);
				result = 1;
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectWithPage(int currentPage, int pageSize){
		Map<String, Object> result = new HashMap<String, Object>();
		List<StockModel> stockModelList = stockService.selectListWithPage(currentPage, pageSize);
		Long count = stockService.count();
		long pageCount = count/pageSize;
		long cy = count%pageSize;
		if(cy != 0){
			pageCount = pageCount + 1;
		}
		result.put("value", stockModelList);
		result.put("pageCount", pageCount);
		result.put("currentPage", currentPage);
		result.put("pageSize", pageSize);
		return result;
	}
}
