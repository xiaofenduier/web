package com.user.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.manage.model.OutModel;
import com.user.manage.service.OutService;

@Controller
@RequestMapping("/out")
public class OutController {
private static final Logger logger = Logger.getLogger(OutController.class);
	
	@Resource
	private OutService outService;
	
	@ResponseBody
	@RequestMapping("add")
	public int add(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		OutModel out = new OutModel();
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		int state = 0;
		out.setStaffId(staffId);
		out.setState(state);
		out.setNum(num);
		out.setName(name);
		int result = 0;
		result = (int) outService.add(out);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("del")
	public int del(HttpServletRequest request){
		int result = 1;
		int id = Integer.parseInt(request.getParameter("id"));
		OutModel out = new OutModel();
		out.setId(id);
		List<OutModel> OutModelList = outService.selectList(id);
		if (OutModelList.size() <= 0){
			result = 0;
		}
		outService.delete(out);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public Map<String, Object> select(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		int id = Integer.parseInt(request.getParameter("id"));
		List<OutModel> outModelList = outService.selectList(id);
		result.put("value", outModelList.get(0));
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
		OutModel out = new OutModel();
		out.setState(state);
		out.setManagerId(managerId);
		out.setId(id);
		out.setNum(num);
		out.setName(name);
		out.setStaffId(staffId);
		outService.update(out);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectWithPage(int currentPage, int pageSize, int state, int peopleid, String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		List<OutModel> outModelList = outService.selectListWithPage(currentPage, pageSize, state, peopleid, roleName);
		Long count = outService.count(state);
		long pageCount = count/pageSize;
		long cy = count%pageSize;
		if(cy != 0){
			pageCount = pageCount + 1;
		}
		result.put("value", outModelList);
		result.put("pageCount", pageCount);
		result.put("currentPage", currentPage);
		result.put("pageSize", pageSize);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("countwithstate")
	public Map<String, Object> countWithState(int staffId){
		Long dcount = outService.countwithstate(-1, 0);
		Long rcount = outService.countwithstate(staffId, 2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("d", dcount);
		map.put("r", rcount);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("downloadExcel")
	public void downloadExcel(int state, int peopleid, String roleName){
		List<OutModel> outModelList = outService.downloadExcel(state, peopleid, roleName);
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
        
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("学生表一");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCell cell = row.createCell((short) 0);  
		
	}
}
