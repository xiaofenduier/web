package com.lj.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.Permission;
import com.lj.demo.service.PermissionService;
import com.lj.demo.service.StateService;
import com.lj.demo.util.ExcelUtil;
import com.lj.demo.util.TimeUtil;

/** 
* @author liujie 
* @version 创建时间：2017年9月21日 下午2:18:26 
* 类说明 
*/
@Controller
@RequestMapping("permission")
public class PermissionController {
	
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private StateService stateService;
	
	@RequestMapping("initPermission")
	@ResponseBody
	public List<Permission> initPermission(Permission permission){
		return permissionService.getPermissionByExample(permission, "asc", "id");
	}
	
	@RequestMapping("initPermission2Map")
	@ResponseBody
	public Map<String, Object> initPermission2Map(Permission permission){
		Map<String, Object> permissionMap = new HashMap<String, Object>();
		List<Permission> permissionList = new ArrayList<Permission>();
		permissionList = permissionService.getPermissionByExample(permission, "asc", "id");
		String dir_page_default = permissionList.get(0).getDir() + "-" + permissionList.get(0).getPage();
		List<Map<String, Object>> strList = new ArrayList<Map<String, Object>>();
		Set<String> dirPageSet = new HashSet<String>();
		for(int i = 0; i < permissionList.size(); i++){
			String dir = permissionList.get(i).getDir();
			String page = permissionList.get(i).getPage();
			String name = permissionList.get(i).getName();
			int id = permissionList.get(i).getId();
			String dir_page = dir + "-" + page;
			dirPageSet.add(dir_page);
			Map<String, Object> strMap = new HashMap<String, Object>();
			strMap.put("id", id);
			strMap.put("name", name);
			if(!dir_page.equals(dir_page_default) || i == permissionList.size() - 1){
				if(i == permissionList.size() - 1){
					strList.add(strMap);
					permissionMap.put(dir_page_default, strList);
				}else{
					permissionMap.put(dir_page_default, strList);
					strList = new ArrayList<Map<String, Object>>();
					dir_page_default = dir_page;
					strList.add(strMap);
				}
			}else{
				strList.add(strMap);
			}
		}
		permissionMap.put("dirPage", dirPageSet);
		System.out.println(permissionMap);
		return permissionMap;
	}
	
	@RequestMapping("getAllPermission")
	@ResponseBody
	public Map<String, Object> getAllPermission(@RequestBody Map<String, Object> page){
		int currentPage = (int) page.get("currentPage");
		int pageSize = (int) page.get("pageSize");
		String orderType = (String) page.get("order");
		String orderName = (String) page.get("ordername");
		String dir = (String) page.get("dir");
		String pageName = (String) page.get("page");
		String operate = (String) page.get("operate");
		Permission permission = new Permission(); 
		if(page.containsKey("search")){
			String search = (String) page.get("search");
			permission.setId(Integer.valueOf(search));
		}
		if(dir != null){
			permission.setDir(dir);
		}
		if(pageName != null){
			permission.setPage(pageName);
		}
		if(operate != null){
			permission.setOperate(operate);
		}
		Map<String ,Object> permissionMap = new HashMap<String, Object>();
		List<Permission> permissionList = new ArrayList<Permission>();
		long totalPage = permissionService.countPermissionByPermissionModel(permission, orderType, orderName);
		permissionList = permissionService.getPermissionListWithPage(permission, currentPage, pageSize, orderType, orderName);
		for(Iterator<Permission> it = permissionList.iterator(); it.hasNext();){
			permission = it.next();
			permission.setState(stateService.getStateById(permission.getStateid()));
		}
		permissionMap.put("rows", permissionList);
		permissionMap.put("total", totalPage);
		return permissionMap;
	}
	
	@RequestMapping("addPermission")
	@ResponseBody
	public int addPermission(Permission permission){
		
		return permissionService.addPermission(permission);
	}
	
	@RequestMapping("deletePermissionById")
	@ResponseBody
	@Transactional
	public int deletePermissionById(String ids){
		System.out.println("---------------------"+ids);
		String idArr[] = ids.split(",");
		for(String id : idArr){
			permissionService.deletePermissionById(Integer.valueOf(id));
		}
		return 1;
	}
	
	@RequestMapping("updatePermissionByIdAll")
	@ResponseBody
	@Transactional
	public int updatePermissionById(String ids, String dirs, String pages, String operates){
		System.out.println("---------------------"+ids);
		String idArr[] = ids.split(",");
		String dirArr[] = dirs.split(",");
		String pageArr[] = pages.split(",");
		String operateArr[] = operates.split(",");
		for(int i = 0; i < idArr.length; i++){
			Permission permission = new Permission();
			permission.setId(Integer.valueOf(idArr[i]));
			permission.setDir(dirArr[i]);
			permission.setPage(pageArr[i]);
			permission.setOperate(operateArr[i]);
			permissionService.updatePermissionById(permission);
		}
		return 1;
	}
	
	@RequestMapping("updatePermissionById")
	@ResponseBody
	@Transactional
	public int updatePermissionById(Permission permission){
		permission.setStateid(stateService.getIdByState(permission.getState()));
		return permissionService.updatePermissionById(permission);
	}
	
	@RequestMapping("exportPermission")
	@ResponseBody
	public void exportPermission() throws InstantiationException{
		Map<String, Object> permissionMap = new HashMap<String, Object>();
		List<String> headerList = new ArrayList<String>();
		headerList.add("编码");
		headerList.add("目录");
		headerList.add("页面");
		headerList.add("操作");
		headerList.add("状态");
		permissionMap.put("header", headerList);
		List<String> sortList = new ArrayList<String>();
		sortList.add("Id");
		sortList.add("Dir");
		sortList.add("Page");
		sortList.add("Operate");
		sortList.add("State");
		permissionMap.put("sort", sortList);
		List<Permission> permissionList = new ArrayList<Permission>();
		Permission permission = new Permission(); 
		permissionList = permissionService.getPermissionListWithPage(permission, -1, -1, "asc", "id");
		for(Iterator<Permission> it = permissionList.iterator(); it.hasNext();){
			permission = it.next();
			permission.setState(stateService.getStateById(permission.getStateid()));
		}
		permissionMap.put("data", permissionList);
		ExcelUtil<Permission> excelUtil = new ExcelUtil<Permission>();
		System.out.println(permissionMap);
		TimeUtil timeUtil = new TimeUtil();
		String currentDate = timeUtil.getCurrentDate();
		String fileName = "E:/permission_" + currentDate + ".xlsx";
		excelUtil.export(permissionMap, fileName);
	}
}
