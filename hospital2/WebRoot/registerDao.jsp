<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 封装user对象 -->
<%
	request.setCharacterEncoding("UTF-8");
	String realname = request.getParameter("realname");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int age = Integer.parseInt(request.getParameter("age"));
	int sex = Integer.parseInt(request.getParameter("sex"));
	String telphone = request.getParameter("telphone");
	String email = request.getParameter("email");
	String passport = request.getParameter("passport");
	User user = new User();
	user.setAge(age);
	user.setEmail(email);
	user.setPassword(password);
	user.setRealname(realname);
	user.setUsername(username);
	user.setTelphone(telphone);
	user.setSex(sex);
	user.setPassport(passport);
	UserDao userDao = new UserDao();
	int result = userDao.add(user);
	if(result > 0){
		response.sendRedirect("login.jsp");
	}else{
		response.sendRedirect("register.jsp");
	}
%>