package com.web.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.order.model.User;
import com.web.order.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("login")
	public User login(User user, HttpServletRequest request) throws Exception{
		List<User> userList = userService.select(user);
		if(userList.size() > 0){
			request.getSession().setAttribute("user", userList.get(0));
			String username = userList.get(0).getUsername();
			String password = userList.get(0).getPassword();
			if (user.getUsername().equals(username) && user.getPassword().equals(password)){
				return userList.get(0);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("register")
	public int register(User user, HttpServletRequest request) throws Exception{
		User old_user = new User();
		old_user.setPhone(user.getPhone());
		List<User> userList = userService.select(old_user);
		System.out.println(userList.size());
		if(userList.size() > 0){
			return 0;
		}else{
			userService.insert(user);
			List<User> userList2 = userService.select(user);
			request.getSession().setAttribute("user", userList2.get(0));
			return 1;
		}
	}
	
	//添加收货地址，修改信息
	@ResponseBody
	@RequestMapping("update")
	public int update(User user) throws Exception{
		userService.update(user);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("getUser")
	public Map<String,Object> getUser(HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		User user = new User();
		user = (User) request.getSession().getAttribute("user");
		map.put("data", user);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithpage(int currentPage, int pageSize, User user){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = userService.count(user);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<User> userList = userService.selectwithpage(user, start, pageSize);
		map.put("data", userList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public int select(User user){
		List<User> userList = userService.select(user);
		if (userList.size() > 0){
			return 1;
		}else{
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping("selectone")
	public User selectone(User user){
		return userService.selectone(user);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(User user){
		return userService.delete(user);
	}
}
