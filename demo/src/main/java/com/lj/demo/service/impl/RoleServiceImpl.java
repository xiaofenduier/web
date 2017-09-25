package com.lj.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lj.demo.dao.RoleMapper;
import com.lj.demo.model.Role;
import com.lj.demo.model.RoleExample;
import com.lj.demo.service.RoleService;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:05:35 
* 类说明 
*/
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> getRoleByExample(Role role, String orderType , String orderName) {
		RoleExample roleExample = new RoleExample();
		roleExample = buildRoleExample(role, orderType, orderName);
		return roleMapper.selectByExample(roleExample);
	}

	private RoleExample buildRoleExample(Role role, String orderType, String orderName){
		RoleExample roleExample = new RoleExample();
		RoleExample.Criteria criteria = roleExample.createCriteria();
		roleExample.setOrderByClause(orderName + " " + orderType);
		if(role.getId() != null){
			criteria.andIdEqualTo(role.getId());
		}
		
		if(role.getRole() != null){
			criteria.andRoleLike(role.getRole());
		}
		return roleExample;
	}

	@Override
	public String getRoleById(int id) {
		return roleMapper.selectByPrimaryKey(id).getRole();
	}

	@Override
	public int getIdByRole(String role) {
		return roleMapper.selectIdByRole(role);
	}

	@Override
	public List<Role> getRoleListWithPage(Role role, int currentPage, int pageSize, String orderType, String orderName) {
		RoleExample roleExample = new RoleExample();
		roleExample = buildRoleExample(role, orderType, orderName);
		if(currentPage != -1 && pageSize != -1){
			roleExample.setCurrentPage(currentPage);
			roleExample.setPageSize(pageSize);
		}
		return roleMapper.selectByExample(roleExample);
	}

	@Override
	public long countRoleByRoleModel(Role role, String orderType, String orderName) {
		RoleExample roleExample = new RoleExample();
		roleExample = buildRoleExample(role, orderType, orderName);
		return roleMapper.countByExample(roleExample);
	}

	@Override
	public int addRole(Role role) {
		return roleMapper.insert(role);
	}

	@Override
	public int deleteRoleById(int id) {
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateRoleById(Role role) {
		return roleMapper.updateByPrimaryKey(role);
	}
}
