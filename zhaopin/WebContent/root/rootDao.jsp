<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.RootDao"%>
<%@ page import="com.zhaopin.entity.Root"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String idStr = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String sex = request.getParameter("sex");
	String telphoneStr = request.getParameter("telphone");
	long telphone = Long.parseLong(telphoneStr);
	int id = Integer.parseInt(idStr);
	Root r = new Root();
	r.setId(id);
	r.setName(name);
	r.setPassword(password);
	r.setSex(sex);
	r.setTelphone(telphone);

	RootDao rDao = new RootDao();
	int result = rDao.update(r);
	response.sendRedirect("root.jsp?state=" + result);
%>
