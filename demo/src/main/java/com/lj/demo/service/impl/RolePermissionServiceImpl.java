package com.lj.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.RolePermissionMapper;
import com.lj.demo.model.RolePermission;
import com.lj.demo.model.RolePermissionExample;
import com.lj.demo.service.RolePermissionService;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:05:35 
* 类说明 
*/
@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	
	@Override
	public List<RolePermission> getRolePermissionByExample(RolePermission rolePermission, String orderType , String orderName) {
		RolePermissionExample rolePermissionExample = new RolePermissionExample();
		rolePermissionExample = buildRolePermissionExample(rolePermission, orderType, orderName);
		return rolePermissionMapper.selectByExample(rolePermissionExample);
	}

	private RolePermissionExample buildRolePermissionExample(RolePermission rolePermission, String orderType, String orderName){
		RolePermissionExample rolePermissionExample = new RolePermissionExample();
		RolePermissionExample.Criteria criteria = rolePermissionExample.createCriteria();
		rolePermissionExample.setOrderByClause(orderName + " " + orderType);
		if(rolePermission.getId() != null){
			criteria.andIdEqualTo(rolePermission.getId());
		}
		
		if(rolePermission.getPermissionids() != null){
			criteria.andPermissionidsEqualTo(rolePermission.getPermissionids());
		}
		if(rolePermission.getRoleid() != null){
			criteria.andRoleidEqualTo(rolePermission.getRoleid());
		}
		return rolePermissionExample;
	}

	@Override
	public List<RolePermission> getRolePermissionListWithPage(RolePermission rolePermission, int currentPage, int pageSize, String orderType, String orderName) {
		RolePermissionExample rolePermissionExample = new RolePermissionExample();
		rolePermissionExample = buildRolePermissionExample(rolePermission, orderType, orderName);
		if(currentPage != -1 && pageSize != -1){
			rolePermissionExample.setCurrentPage(currentPage);
			rolePermissionExample.setPageSize(pageSize);
		}
		return rolePermissionMapper.selectByExample(rolePermissionExample);
	}

	@Override
	public long countRolePermissionByRolePermissionModel(RolePermission rolePermission, String orderType, String orderName) {
		RolePermissionExample rolePermissionExample = new RolePermissionExample();
		rolePermissionExample = buildRolePermissionExample(rolePermission, orderType, orderName);
		return rolePermissionMapper.countByExample(rolePermissionExample);
	}

	@Override
	public int addRolePermission(RolePermission rolePermission) {
		return rolePermissionMapper.insert(rolePermission);
	}

	@Override
	public int deleteRolePermissionById(int id) {
		return rolePermissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateRolePermissionById(RolePermission rolePermission) {
		return rolePermissionMapper.updateByPrimaryKey(rolePermission);
	}

	@Override
	public RolePermission rolePermissionById(int id) {
		return rolePermissionMapper.selectByPrimaryKey(id);
	}
}
