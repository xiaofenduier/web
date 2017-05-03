package com.user.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.manage.model.RoleModel;
import com.user.manage.model.UserModel;
import com.user.manage.service.RoleService;
import com.user.manage.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	private int i = 1;
	
	@ResponseBody
	@RequestMapping("login")
	public UserModel login(HttpServletRequest request) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		List<UserModel> userModelList = userService.selectList(username, password);
		if(userModelList.size() > 0){
			if(i%2==0){
				i++;
				request.getSession().setAttribute("user", userModelList.get(0));
				return userModelList.get(0);
			}else{
				i++;
				return null;
			}
		}else{
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("zhuxiao")
	public int zhuxiao(HttpServletRequest request) throws Exception{
		request.getSession().removeAttribute("user");
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("add")
	public int add(HttpServletRequest request) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String roleName = request.getParameter("roleName");
		List<UserModel> userModelList = userService.selectList(username, password);
		if(userModelList.size() > 0){
			return 0;
		}else{
			UserModel user = new UserModel();
			user.setName(name);
			user.setPassword(password);
			user.setRoleName(roleName);
			user.setUsername(username);
			userService.add(user);
			return 1;
		}
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(HttpServletRequest request) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String roleName = request.getParameter("roleName");
		List<UserModel> userModelList = userService.selectList(username, password);
		if(userModelList.size() > 0){
			return 0;
		}else{
			UserModel user = new UserModel();
			user.setId(userModelList.get(0).getId());
			user.setName(name);
			user.setPassword(password);
			user.setRoleName(roleName);
			user.setUsername(username);
			userService.update(user);
			return 1;
		}
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectWithPage(int currentPage, int pageSize){
		Map<String, Object> result = new HashMap<String, Object>();
		List<UserModel> userModelList = userService.selectListWithPage(currentPage, pageSize);
		Long count = userService.count();
		long pageCount = count/pageSize;
		long cy = count%pageSize;
		if(cy != 0){
			pageCount = pageCount + 1;
		}
		result.put("value", userModelList);
		result.put("pageCount", pageCount);
		result.put("currentPage", currentPage);
		result.put("pageSize", pageSize);
		return result;
	}

	@ResponseBody
	@RequestMapping("del")
	public int del(HttpServletRequest request){
		int result = 1;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		UserModel user = new UserModel();
		user.setName(name);
		user.setPassword(password);
		user.setUsername(username);
		List<UserModel> userModelList = userService.selectList(username, password);
		if (userModelList.size() <= 0){
			return 0;
		}
		user.setId(userModelList.get(0).getId());
		userService.delete(user);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("getRole")
	public Map<String, Object> getRole(){
		Map<String, Object> result = new HashMap<String, Object>();
		List<RoleModel> roleModelList = roleService.selectList();
		result.put("value", roleModelList);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("getUser")
	public Map<String,Object> getUser(HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		UserModel user = new UserModel();
		user = (UserModel) request.getSession().getAttribute("user");
		map.put("data", user);
		return map;
	}
}
