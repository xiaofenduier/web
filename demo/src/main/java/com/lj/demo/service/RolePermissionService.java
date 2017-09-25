package com.lj.demo.service;

import java.util.List;

import com.lj.demo.model.RolePermission;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:04:30 
* 类说明 
*/
public interface RolePermissionService {
	public List<RolePermission> getRolePermissionByExample(RolePermission rolePermission, String orderType , String orderName);
	List<RolePermission> getRolePermissionListWithPage(RolePermission rolePermission, int start, int pageSize, String orderType , String orderName);
	public long countRolePermissionByRolePermissionModel(RolePermission rolePermission, String orderType , String orderName);
	public int addRolePermission(RolePermission rolePermission);
	public int deleteRolePermissionById(int id);
	public int updateRolePermissionById(RolePermission rolePermission);
	public RolePermission rolePermissionById(int id);
}
