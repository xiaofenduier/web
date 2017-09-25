package com.lj.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.Permission;
import com.lj.demo.model.RolePermission;
import com.lj.demo.service.PermissionService;
import com.lj.demo.service.RolePermissionService;
import com.lj.demo.service.RoleService;
import com.lj.demo.util.ExcelUtil;
import com.lj.demo.util.TimeUtil;

/** 
* @author liujie 
* @version 创建时间：2017年9月21日 下午5:05:53 
* 类说明 
*/
@Controller
@RequestMapping("rolePermission")
public class RolePermissionController {
	
	@Autowired
	private RolePermissionService rolePermissionService;
	
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("getAllRolePermission")
	@ResponseBody
	public Map<String, Object> getAllRolePermission(@RequestBody Map<String, Object> page){
		int currentPage = (int) page.get("currentPage");
		int pageSize = (int) page.get("pageSize");
		String orderType = (String) page.get("order");
		String orderName = (String) page.get("ordername");
		RolePermission rolePermission = new RolePermission(); 
		if(page.containsKey("search")){
			String search = (String) page.get("search");
			rolePermission.setId(Integer.valueOf(search));
		}
		Map<String ,Object> rolePermissionMap = new HashMap<String, Object>();
		List<RolePermission> rolePermissionList = new ArrayList<RolePermission>();
		long totalPage = rolePermissionService.countRolePermissionByRolePermissionModel(rolePermission, orderType, orderName);
		rolePermissionList = rolePermissionService.getRolePermissionListWithPage(rolePermission, currentPage, pageSize, orderType, orderName);
		for(RolePermission result : rolePermissionList){
			List<String> permissionList = Arrays.asList(result.getPermissionids().split(","));
			String permission = StringUtils.EMPTY;
			for(String str : permissionList){
				System.out.println("---------------------"+str);
				if(StringUtils.isEmpty(permission)){
					permission = permissionService.getPermissionById(Integer.valueOf(str)).getName();
				}else{
					permission = permission + "," +permissionService.getPermissionById(Integer.valueOf(str)).getName();
				}
			}
			System.out.println("================="+permission);
			result.setPermissionnames(permission);
			result.setRolename(roleService.getRoleById(Integer.valueOf(result.getRoleid())));
		}
		rolePermissionMap.put("rows", rolePermissionList);
		rolePermissionMap.put("total", totalPage);
		return rolePermissionMap;
	}
	
	@RequestMapping("updateRolePermissionById")
	@ResponseBody
	public int updateRolePermissionById(RolePermission rolePermission){
		return rolePermissionService.updateRolePermissionById(rolePermission);
	}
	
	@RequestMapping("addRolePermission")
	@ResponseBody
	public int addRolePermission(RolePermission rolePermission){
		return rolePermissionService.addRolePermission(rolePermission);
	}
	
	@RequestMapping("deleteRolePermissionById")
	@ResponseBody
	@Transactional
	public int deleteRolePermissionById(String ids){
		System.out.println(ids);
		String idsArr[] = ids.split(",");
		for(int i = 0; i < idsArr.length; i++){
			rolePermissionService.deleteRolePermissionById(Integer.valueOf(idsArr[i]));
		}
		return 1;
	}
	
	@RequestMapping("exportRolePermission")
	@ResponseBody
	public void exportRolePermission() throws InstantiationException{
		Map<String, Object> rolePermissionMap = new HashMap<String, Object>();
		List<String> headerList = new ArrayList<String>();
		headerList.add("编码");
		headerList.add("角色");
		headerList.add("拥有权限");
		rolePermissionMap.put("header", headerList);
		List<String> sortList = new ArrayList<String>();
		sortList.add("Id");
		sortList.add("Rolename");
		sortList.add("Permissionnames");
		rolePermissionMap.put("sort", sortList);
		List<RolePermission> rolePermissionList = new ArrayList<RolePermission>();
		RolePermission rolePermission = new RolePermission(); 
		rolePermissionList = rolePermissionService.getRolePermissionByExample(rolePermission, "asc", "id");
		for(int i = 0; i < rolePermissionList.size(); i++){
			rolePermissionList.get(i).setRolename(roleService.getRoleById(rolePermissionList.get(i).getRoleid()));
			String permissionIdsArr[] = rolePermissionList.get(i).getPermissionids().split(",");
			List<String> permissionList = new ArrayList<String>();
			for(int p = 0; p < permissionIdsArr.length; p++){
				permissionList.add(permissionService.getPermissionById(Integer.valueOf(permissionIdsArr[p])).getName());
			}
			rolePermissionList.get(i).setPermissionnames(String.join(",", permissionList));
		}
		rolePermissionMap.put("data", rolePermissionList);
		ExcelUtil<Permission> excelUtil = new ExcelUtil<Permission>();
		System.out.println(rolePermissionMap);
		TimeUtil timeUtil = new TimeUtil();
		String currentDate = timeUtil.getCurrentDate();
		String fileName = "E:/rolepermission_" + currentDate + ".xlsx";
		excelUtil.export(rolePermissionMap, fileName);
	}
}
