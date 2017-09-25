package com.lj.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.Role;
import com.lj.demo.service.RoleService;
import com.lj.demo.util.ExcelUtil;
import com.lj.demo.util.TimeUtil;

/** 
* @author liujie 
* @version 创建时间：2017年9月18日 上午10:46:27 
* 类说明 
*/
@Controller
@RequestMapping("role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping("initRole")
	@ResponseBody
	public List<Role> initRole(Role role){
		return roleService.getRoleByExample(role, "asc", "id");
	}
	
	@RequestMapping("getAllRole")
	@ResponseBody
	public Map<String, Object> getAllRole(@RequestBody Map<String, Object> page){
		int currentPage = (int) page.get("currentPage");
		int pageSize = (int) page.get("pageSize");
		String orderType = (String) page.get("order");
		String orderName = (String) page.get("ordername");
		Role role = new Role(); 
		if(page.containsKey("search")){
			String search = (String) page.get("search");
			role.setRole(search);
		}
		Map<String ,Object> roleMap = new HashMap<String, Object>();
		List<Role> roleList = new ArrayList<Role>();
		long totalPage = roleService.countRoleByRoleModel(role, orderType, orderName);
		roleList = roleService.getRoleListWithPage(role, currentPage, pageSize, orderType, orderName);
		roleMap.put("rows", roleList);
		roleMap.put("total", totalPage);
		return roleMap;
	}
	
	@RequestMapping("addRole")
	@ResponseBody
	public int addRole(Role role){
		return roleService.addRole(role);
	}
	
	@RequestMapping("deleteRoleById")
	@ResponseBody
	@Transactional
	public int deleteRoleById(String ids){
		System.out.println("---------------------"+ids);
		String idArr[] = ids.split(",");
		for(String id : idArr){
			Role role = new Role();
			role.setId(Integer.valueOf(id));
			roleService.deleteRoleById(role.getId());
		}
		return 1;
	}
	
	@RequestMapping("updateRoleByIdAll")
	@ResponseBody
	@Transactional
	public int updateRoleById(String ids, String roles){
		System.out.println("---------------------"+ids);
		String idArr[] = ids.split(",");
		String roleArr[] = roles.split(",");
		for(int i = 0; i < idArr.length; i++){
			Role role = new Role();
			role.setId(Integer.valueOf(idArr[i]));
			role.setRole(roleArr[i]);
			roleService.updateRoleById(role);
		}
		return 1;
	}
	
	@RequestMapping("updateRoleById")
	@ResponseBody
	@Transactional
	public int updateRoleById(Role role){
		return roleService.updateRoleById(role);
	}
	
	@RequestMapping("exportRole")
	@ResponseBody
	public void exportRole() throws InstantiationException{
		Map<String, Object> roleMap = new HashMap<String, Object>();
		List<String> headerList = new ArrayList<String>();
		headerList.add("编码");
		headerList.add("角色");
		roleMap.put("header", headerList);
		List<String> sortList = new ArrayList<String>();
		sortList.add("Id");
		sortList.add("Name");
		roleMap.put("sort", sortList);
		List<Role> roleList = new ArrayList<Role>();
		Role role = new Role(); 
		roleList = roleService.getRoleListWithPage(role, -1, -1, "asc", "id");
		roleMap.put("data", roleList);
		ExcelUtil<Role> excelUtil = new ExcelUtil<Role>();
		System.out.println(roleMap);
		TimeUtil timeUtil = new TimeUtil();
		String currentDate = timeUtil.getCurrentDate();
		String fileName = "E:/role_" + currentDate + ".xlsx";
		excelUtil.export(roleMap, fileName);
	}
}
