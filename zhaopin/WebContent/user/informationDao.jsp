<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.UserDao"%>
<%@ page import="com.zhaopin.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
String realname = request.getParameter("realname");
String password = request.getParameter("password");
String sex = request.getParameter("sex");
String telphoneStr = request.getParameter("telphone");
long telphone = Long.parseLong(telphoneStr);
String email = request.getParameter("email");

User user = new User();
user.setEmail(email);
user.setPassword(password);
user.setRealName(realname);
user.setSex(sex);
user.setTelphone(telphone);
user.setJianliId(0);

UserDao userDao = new UserDao();
int result = userDao.update(user);
response.sendRedirect("information.jsp?state="+result);
%>
