package com.lj.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.PermissionMapper;
import com.lj.demo.model.Permission;
import com.lj.demo.model.PermissionExample;
import com.lj.demo.service.PermissionService;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:05:35 
* 类说明 
*/
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	
	@Override
	public List<Permission> getPermissionByExample(Permission permission, String orderType , String orderName) {
		PermissionExample permissionExample = new PermissionExample();
		permissionExample = buildPermissionExample(permission, orderType, orderName);
		return permissionMapper.selectByExample(permissionExample);
	}

	private PermissionExample buildPermissionExample(Permission permission, String orderType, String orderName){
		PermissionExample permissionExample = new PermissionExample();
		PermissionExample.Criteria criteria = permissionExample.createCriteria();
		permissionExample.setOrderByClause(orderName + " " + orderType);
		if(permission.getId() != null){
			criteria.andIdEqualTo(permission.getId());
		}
		
		if(permission.getDir() != null){
			criteria.andDirEqualTo(permission.getDir());
		}
		if(permission.getPage() != null){
			criteria.andPageEqualTo(permission.getPage());
		}
		if(permission.getOperate() != null){
			criteria.andOperateEqualTo(permission.getOperate());
		}
		return permissionExample;
	}

	@Override
	public List<Permission> getPermissionListWithPage(Permission permission, int currentPage, int pageSize, String orderType, String orderName) {
		PermissionExample permissionExample = new PermissionExample();
		permissionExample = buildPermissionExample(permission, orderType, orderName);
		if(currentPage != -1 && pageSize != -1){
			permissionExample.setCurrentPage(currentPage);
			permissionExample.setPageSize(pageSize);
		}
		return permissionMapper.selectByExample(permissionExample);
	}

	@Override
	public long countPermissionByPermissionModel(Permission permission, String orderType, String orderName) {
		PermissionExample permissionExample = new PermissionExample();
		permissionExample = buildPermissionExample(permission, orderType, orderName);
		return permissionMapper.countByExample(permissionExample);
	}

	@Override
	public int addPermission(Permission permission) {
		return permissionMapper.insert(permission);
	}

	@Override
	public int deletePermissionById(int id) {
		return permissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updatePermissionById(Permission permission) {
		return permissionMapper.updateByPrimaryKey(permission);
	}

	@Override
	public Permission getPermissionById(int id) {
		return permissionMapper.selectByPrimaryKey(id);
	}
}
