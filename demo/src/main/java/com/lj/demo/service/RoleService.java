package com.lj.demo.service;

import java.util.List;

import com.lj.demo.model.Role;

/** 
* @author liujie 
* @version 创建时间：2017年9月15日 下午3:04:30 
* 类说明 
*/
public interface RoleService {
	public List<Role> getRoleByExample(Role role, String orderType , String orderName);
	public String getRoleById(int id);
	public int getIdByRole(String role);
	List<Role> getRoleListWithPage(Role role, int start, int pageSize, String orderType , String orderName);
	public long countRoleByRoleModel(Role role, String orderType , String orderName);
	public int addRole(Role role);
	public int deleteRoleById(int id);
	public int updateRoleById(Role role);
}
