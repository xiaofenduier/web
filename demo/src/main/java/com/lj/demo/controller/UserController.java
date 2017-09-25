package com.lj.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.User;
import com.lj.demo.service.RoleService;
import com.lj.demo.service.StateService;
import com.lj.demo.service.UserService;
import com.lj.demo.util.ExcelUtil;
import com.lj.demo.util.TimeUtil;

/** 
* @author liujie 
* @version 创建时间：2017年9月1日 下午2:30:30 
* 类说明 
*/
@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private StateService stateService;
	
	@RequestMapping("getUserListWithPage")
	@ResponseBody
	public Map<String, Object> getUserListWithPage(@RequestBody Map<String, Object> page){
		int currentPage = (int) page.get("currentPage");
		int pageSize = (int) page.get("pageSize");
		String orderType = (String) page.get("order");
		String orderName = (String) page.get("ordername");
		String role = (String) page.get("role");
		String name = (String) page.get("name");
		System.out.println(role);
		System.out.println(name);
		User user = new User();
		if(page.containsKey("search")){
			String search = (String) page.get("search");
			System.out.println("==============================" + search);
			user.setId(Integer.valueOf(search));
			System.out.println("==============================" + user.getId());
		}
		Map<String, Object> userMap = new HashMap<String, Object>();
		if(role != null && !role.isEmpty()){
			user.setRole(role);
			user.setRoleid(roleService.getIdByRole(role));
		}
		if(name != null && !name.isEmpty()){
			user.setName(name);
		}
		System.out.println("==================================" + user.getRoleid());
		System.out.println("==================================" + user.getName());
		long totalPage = userService.countUserByUserModel(user, orderType, orderName);
		List<User> userList = userService.getUserListWithPage(user, currentPage, pageSize, orderType , orderName);
		for(Iterator<User> it = userList.iterator(); it.hasNext();){
			user = it.next();
			user.setState(stateService.getStateById(user.getStateid()));
			user.setRole(roleService.getRoleById(user.getRoleid()));
			System.out.println(user.getRole());
		}
		userMap.put("total", totalPage);
		userMap.put("rows", userList);
		System.out.println(userMap);
		return userMap;
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	public int addUser(User user){
		String telphone = user.getTelphone();
		if(StringUtils.isEmpty(telphone)){
			return 0;
		}
		return userService.addUser(user);
	}
	
	@RequestMapping("exportUser")
	@ResponseBody
	public void exportUser() throws InstantiationException{
		Map<String, Object> userMap = new HashMap<String, Object>();
		List<String> headerList = new ArrayList<String>();
		headerList.add("编码");
		headerList.add("姓名");
		headerList.add("用户名");
		headerList.add("密码");
		headerList.add("邮箱");
		headerList.add("电话");
		headerList.add("角色");
		headerList.add("状态");
		userMap.put("header", headerList);
		
		List<String> sortList = new ArrayList<String>();
		sortList.add("Id");
		sortList.add("Name");
		sortList.add("Username");
		sortList.add("Password");
		sortList.add("Mail");
		sortList.add("Telphone");
		sortList.add("Role");
		sortList.add("State");
		
		userMap.put("sort", sortList);
		List<User> userList = new ArrayList<User>();
		User user = new User(); 
		userList = userService.getUserListWithPage(user, -1, -1, "asc", "id");
		for(Iterator<User> it = userList.iterator(); it.hasNext();){
			user = it.next();
			user.setState(stateService.getStateById(user.getStateid()));
			user.setRole(roleService.getRoleById(user.getRoleid()));
		}
		userMap.put("data", userList);
		ExcelUtil<User> excelUtil = new ExcelUtil<User>();
		System.out.println(userMap);
		TimeUtil timeUtil = new TimeUtil();
		String currentDate = timeUtil.getCurrentDate();
		String fileName = "E:/user_" + currentDate + ".xlsx";
		excelUtil.export(userMap, fileName);
	}
}
