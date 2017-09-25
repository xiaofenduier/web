package com.lj.demo.service;

import java.util.List;

import com.lj.demo.model.Permission;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:04:30 
* 类说明 
*/
public interface PermissionService {
	public List<Permission> getPermissionByExample(Permission permission, String orderType , String orderName);
	List<Permission> getPermissionListWithPage(Permission permission, int start, int pageSize, String orderType , String orderName);
	public long countPermissionByPermissionModel(Permission permission, String orderType , String orderName);
	public int addPermission(Permission permission);
	public int deletePermissionById(int id);
	public int updatePermissionById(Permission permission);
	public Permission getPermissionById(int id);
}
