package com.web.badminton.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.badminton.model.User;
import com.web.badminton.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("login")
	public List<User> login(User user, HttpServletRequest request){
		int start = 0;
		int pageSize = 5;
		List<User> userList = new ArrayList<User>();
		userList = userService.selectList(user, start, pageSize);
		if(userList.size() > 0){
			request.getSession().setAttribute("userObj", userList.get(0));
		}
		return userList;
	}
	
	@ResponseBody
	@RequestMapping("select")
	public User select(User user){
		int start = 0;
		int pageSize = 5;
		List<User> userList = new ArrayList<User>();
		userList = userService.selectList(user, start, pageSize);
		if(userList.size() > 0){
			return userList.get(0);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping("selectbyid")
	public User selectbyid(User user){
		return userService.selectbyid(user);
	}
	
	@ResponseBody
	@RequestMapping("islogin")
	public Map<String, Object> islogin(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("userObj");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", user);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("add")
	public int add(User user){
		return userService.add(user);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public int delete(User user){
		return userService.delete(user);
	}
	
	@ResponseBody
	@RequestMapping("quit")
	public int quit(User user, HttpServletRequest request){
		request.getSession().removeAttribute("userObj");
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("update")
	public int update(User user, HttpServletRequest request){
		userService.update(user);
		user = userService.selectbyid(user);
		request.getSession().removeAttribute("userObj");
		request.getSession().setAttribute("userObj", user);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("selectwithpage")
	public Map<String, Object> selectwithPage(User user, int currentPage, int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		long count = userService.count(user);
		long pageCount = count/pageSize;
		long flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;
		}
		int start = (currentPage-1) * pageSize;
		List<User> userList = new ArrayList<User>();
		userList = userService.selectList(user, start, pageSize);
		map.put("data", userList);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		return map;
	}
}
